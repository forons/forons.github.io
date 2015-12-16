#!/usr/bin/env bash

# Website deploy script
# Original version by Matteo Lissandrini
# https://github.com/kuzeko/
#    Academic-Webpage-Docpad-Boilerpate/blob/master/bin/deploy.sh

set -o errexit

NFLAG=""
SFLAG=""

while getopts ":nspt" opt; do
  case $opt in
    n)
      NFLAG="-n"
      ;;
    p)
      PUSH_REPO=true
      ;;
    s)
      SFLAG="--size-only"
      ;;
    t)
      TUNNEL=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "Valid Options: " >&2
      echo "  -s    :   --size-only" >&2
      echo "  -n   :   perform dry-run" >&2
      ;;
  esac
done

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  echo "Loading RVM from home"
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  echo "Loading RVM from usr/local"
  source "/usr/local/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"
  exit -1
fi

echo ""

if [[ $PUSH_REPO ]] ; then
  echo ""  
  echo "Pushing git repo: git push origin master"
  echo ""
  git push origin master
fi

# Set the environment by loading from the file "environment" in the base directory
DIR="$( cd "$( dirname $( dirname "$0" ) )" && pwd)"
source "$DIR/.environment"

echo "Deploying ${DIR}/${DEPLOY_SOURCE_DIR} to ${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"
if [[ $TUNNEL ]] ; then
  echo "---> tunneling through ${TUNNEL_SERVER}:${TUNNEL_PORT}"
fi

echo ""
echo "Regenerating static files with jekyll"
echo ""
rvm use default
jekyll build

echo -n "Clean up directory "
chmod -R og+Xr "${DIR}/${DEPLOY_SOURCE_DIR}"
find . -type f -name '*.DS_Store' -ls -delete
echo "...done"

# Transfer to server with rsync
echo ""
echo "Performing transfer to server"

if ! [[ $TUNNEL ]]  ; then
  echo ""
  rsync $NFLAG -rvzp  $SFLAG --delete --exclude-from="$DIR/.deployignore" "${DIR}/${DEPLOY_SOURCE_DIR}" "${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"
else
  echo "---> tunneling via $TUNNEL_SERVER:$TUNNEL_PORT"
  echo ""
  # rsync -v -e "ssh -p 22222" compito_new.pdf consonni@localhost:~
  rsync $NFLAG -rvzp  $SFLAG -e "ssh -p $TUNNEL_PORT" --delete --exclude-from="$DIR/.deployignore" "${DIR}/${DEPLOY_SOURCE_DIR}" "${DEPLOY_ACCOUNT}@${TUNNEL_SERVER}:${DEPLOY_DEST_DIR}"
fi
