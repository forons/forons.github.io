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
  -d                Enable debug output (implies -v).
  -e ENV_FILE       Environment file to read the configuration from.
  -n                Dry-run, does not deploy any file.
  -p                Push repo before deplying.
  -r RUBY_VERSION   Override Ruby version to use.
  -s                Pass --size-only option to rsync.
  -t                Tunnel connection (see .environment).
  -q                Suppress output (incompatible with --debug or --verbose).
  -v                Enable verbose output.
  -V                Show version information.
  -h                Show this help and exits.
")
}

version(){
  (>&2 echo \
"ddeploy.sh 0.1.0
copyright (c) 2018 Cristian Consonni
MIT License
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
")
}


DEBUG=false
NFLAG=""
SFLAG=""
PUSH_REPO=false
RUBY_VERSION_CLI=""
TUNNEL=false
ENV_FILE=""
QUIET=false

while getopts ":denpr:stvVh" opt; do
  case $opt in
    d)
      DEBUG=true
      ;;
    e)
      ENV_FILE="$OPTARG"
      ;;
    n)
      NFLAG="-n"
      ;;
    p)
      PUSH_REPO=true
      ;;
    r)
      RUBY_VERSION_CLI="$OPTARG"
      ;;
    s)
      SFLAG="--size-only"
      ;;
    t)
      TUNNEL=true
      ;;
    q)
      QUIET=true
      ;;
    v)
      VERBOSE=true
      ;;
    V)
      version
      exit 0
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

if ($DEBUG || $VERBOSE) && $QUIET; then
  (>&2 echo "Error: --quiet and --debug/--verbose options are incompatible.")
  usage
  exit 1
fi

# -d (debug) implies -v (verbose)
if $DEBUG; then { VERBOSE=true; } fi

#################### Utils
if $DEBUG; then
  echodebug() {
    (>&2 echo -en "[$(date '+%F_%k:%M:%S')][debug]\\t" )
    (>&2 echo "$@" )
  }
 else
  echodebug() { true; }
 fi

 if $VERBOSE; then
  echoverbose() {
    (>&2 echo -en "[$(date '+%F_%k:%M:%S')][info]\\t" )
    (>&2 echo "$@" )
  }
 else
  echoverbose() { true; }
 fi
####################

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  echoverbose "Loading RVM from home"

  set +u
  # shellcheck disable=SC1090
  source "$HOME/.rvm/scripts/rvm"
  set -u

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  echoverbose "Loading RVM from usr/local"

  set +u
  # shellcheck disable=SC1091
  source "/usr/local/rvm/scripts/rvm"
  set -u

else

  (>&2 printf "ERROR: An RVM installation was not found.\\n")
  exit -1
fi

echodebug "NFLAG: $NFLAG"
echodebug "SFLAG: $SFLAG"
echodebug "PUSH_REPO: $PUSH_REPO"
echodebug "TUNNEL: $TUNNEL"

echo ""

if $PUSH_REPO; then
  echoverbose ""
  echoverbose "Pushing git repo: git push origin master"
  echoverbose ""

  verbosity_flag='--quiet'
  if $VERBOSE; then
    verbosity_flag=''
  fi

  git push "$verbosity_flag" origin master
fi

# Set the environment by loading from the file .environment in the base
# directory
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
repo_basedir=$(cd "$scriptdir" && git rev-parse --show-toplevel)


if [ -z "$ENV_FILE" ]; then
  ENV_FILE="$repo_basedir/.environment"
fi

echodebug "ENV_FILE: $ENV_FILE"

# shellcheck disable=SC1090
source "$ENV_FILE"

# if Ruby version was specified from the cli, override the config read from
# .enviroment
if [ ! -z "$RUBY_VERSION_CLI" ]; then
  RUBY_VERSION="$RUBY_VERSION_CLI"
fi

echoverbose "Using Ruby version: $RUBY_VERSION"

echoverbose "Deploying ${repo_basedir}/${DEPLOY_SOURCE_DIR} to "\
     "${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"

if $TUNNEL; then
  echoverbose "---> tunneling through ${TUNNEL_SERVER}:${TUNNEL_PORT}"
fi

echoverbose ""
echoverbose "Regenerating static files with jekyll"
echoverbose ""
rvm use "$RUBY_VERSION"
jekyll build

echoverbose -n "Clean up directory "
chmod -R og+Xr "${repo_basedir}/${DEPLOY_SOURCE_DIR}"
find . -type f -name '*.DS_Store' -ls -delete
echoverbose "...done"

# Transfer to server with rsync
echoverbose ""
echoverbose "Performing transfer to server"

# Ensure .deployignore exists
touch "${repo_basedir}/.deployignore"

if ! $TUNNEL; then
  echoverbose ""
  rsync $NFLAG -rvzp  $SFLAG --delete --exclude-from="${repo_basedir}/.deployignore" \
          "${repo_basedir}/${DEPLOY_SOURCE_DIR}" \
          "${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"
else
  echoverbose "---> tunneling via $TUNNEL_SERVER:$TUNNEL_PORT"
  echoverbose ""

  verbosity_flag=''
  if $DEBUG; then
    verbosity_flag='-v'
  fi

  rsync "$verbosity_flag" $NFLAG -rzp  $SFLAG -e "ssh -p $TUNNEL_PORT" \
        --delete \
        --exclude-from="${repo_basedir}/.deployignore" \
          "${DIR}/${DEPLOY_SOURCE_DIR}" \
          "${DEPLOY_ACCOUNT}@${TUNNEL_SERVER}:${DEPLOY_DEST_DIR}"
fi
