#!/usr/bin/env bash

# Website deploy script
# Original version by Matteo Lissandrini
# https://github.com/kuzeko/Academic-Webpage-Docpad-Boilerpate/blob/master/bin/deploy.sh

set -o nounset
set -o errexit

NFLAG=""
SFLAG=""

while getopts ":ns" opt; do
  case $opt in
    s)
      SFLAG="--size-only"
      ;;
    n)
      NFLAG="-n"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "Valid Options: " >&2
      echo "  -s    :   --size-only" >&2
      echo "  -n   :   perform dry-run" >&2
      ;;
  esac
done

# Set the environment by loading from the file "environment" in the base directory
DIR="$( cd "$( dirname $( dirname "$0" ) )" && pwd)"
source "$DIR/.environment"

echo "Deploying ${DIR}/${DEPLOY_SOURCE_DIR} to ${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"

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
echo ""
#rsync $NFLAG -rvzp --size-only --delete --exclude-from="$DIR/.deployignore" "${DIR}/${DEPLOY_SOURCE_DIR}" "${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"
rsync $NFLAG -rvzp  $SFLAG --delete --exclude-from="$DIR/.deployignore" "${DIR}/${DEPLOY_SOURCE_DIR}" "${DEPLOY_ACCOUNT}@${DEPLOY_SERVER}:${DEPLOY_DEST_DIR}"

