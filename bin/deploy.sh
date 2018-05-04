#!/usr/bin/env bash

# Website deploy script
# Original version by Matteo Lissandrini
# https://github.com/kuzeko/
#    Academic-Webpage-Docpad-Boilerpate/blob/master/bin/deploy.sh

# shellcheck disable=SC2128
SOURCED=false && [ "$0" = "$BASH_SOURCE" ] || SOURCED=true

if ! $SOURCED; then
  set -euo pipefail
  IFS=$'\n\t'
fi

usage(){
  (>&2 echo \
"Usage:
  deploy.sh [options]

Deploy the website to production.
The configuration is in <repo_base>/.environment

Options:
  -n                Dry-run, does not deploy any file.
  -p                Push repo before deplying.
  -r RUBY_VERSION   Override Ruby version to use.
  -s                Pass --size-only option to rsync.
  -t                Tunnel connection (see .environment).
  -h                Show this help and exits.
")
}

NFLAG=""
SFLAG=""
PUSH_REPO=false
RUBY_VERSION_CLI=""
TUNNEL=false

while getopts ":npr:sth" opt; do
  case $opt in
    n)
      NFLAG="-n"
      ;;
    p)
      PUSH_REPO=true
      ;;
    r)
      echo "-r option triggered!"
      RUBY_VERSION_CLI="$OPTARG"
      ;;
    s)
      SFLAG="--size-only"
      ;;
    t)
      TUNNEL=true
      ;;
    h)
      usage
      exit 0
      ;;
    \?)
      (>&2 echo "Invalid option: -$OPTARG" )
      usage
      exit 1
      ;;
    :)
      (>&2 echo "Option -$OPTARG requires an argument." )
      exit 1
      ;;
  esac
done

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  echo "Loading RVM from home"

  set +u
  # shellcheck disable=SC1090
  source "$HOME/.rvm/scripts/rvm"
  set -u

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  echo "Loading RVM from usr/local"

  set +u
  # shellcheck disable=SC1091
  source "/usr/local/rvm/scripts/rvm"
  set -u

else

  (>&2 printf "ERROR: An RVM installation was not found.\\n")
  exit -1
fi

echo "NFLAG: $NFLAG"
echo "SFLAG: $SFLAG"
echo "PUSH_REPO: $PUSH_REPO"
echo "TUNNEL: $TUNNEL"

echo ""

if $PUSH_REPO; then
  echo ""  
  echo "Pushing git repo: git push origin master"
  echo ""
  git push origin master
fi

# Set the environment by loading from the file .environment in the base
# directory
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
repo_basedir=$(cd "$scriptdir" && git rev-parse --show-toplevel)

# shellcheck disable=SC1090
source "$repo_basedir/.environment"

# if Ruby version was specified from the cli, override the config read from
# .enviroment
if [ ! -z "$RUBY_VERSION_CLI" ]; then
  RUBY_VERSION="$RUBY_VERSION_CLI"
fi

echo "Using Ruby version: $RUBY_VERSION"

echo "Deploying ${repo_basedir}/${DEPLOY_SOURCE_DIR} to "\
     "${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"

if $TUNNEL; then
  echo "---> tunneling through ${TUNNEL_SERVER}:${TUNNEL_PORT}"
fi

echo ""
echo "Regenerating static files with jekyll"
echo ""
rvm use "$RUBY_VERSION"
jekyll build

echo -n "Clean up directory "
chmod -R og+Xr "${repo_basedir}/${DEPLOY_SOURCE_DIR}"
find . -type f -name '*.DS_Store' -ls -delete
echo "...done"

# Transfer to server with rsync
echo ""
echo "Performing transfer to server"

# Ensure .deployignore exists
touch "${repo_basedir}/.deployignore"

if ! $TUNNEL; then
  echo ""
  rsync $NFLAG -rvzp  $SFLAG --delete --exclude-from="${repo_basedir}/.deployignore" \
          "${repo_basedir}/${DEPLOY_SOURCE_DIR}" \
          "${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"
else
  echo "---> tunneling via $TUNNEL_SERVER:$TUNNEL_PORT"
  echo ""
  # rsync -v -e "ssh -p 22222" compito_new.pdf consonni@localhost:~
  rsync $NFLAG -rvzp  $SFLAG -e "ssh -p $TUNNEL_PORT" --delete \
        --exclude-from="${repo_basedir}/.deployignore" \
          "${DIR}/${DEPLOY_SOURCE_DIR}" \
          "${DEPLOY_ACCOUNT}@${TUNNEL_SERVER}:${DEPLOY_DEST_DIR}"
fi
