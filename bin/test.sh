#!/usr/bin/env bash

# Website testing script
# (c) 2017 Cristian Consonni
# Released under the MIT license

ruby_version='default'

read -d '' docstring <<EOF
Usage:
  test.sh [options]
  test.sh ( -h | --help )
  test.sh ( --version )

  Options:
    --ruby-version RUBY_VERSION	  Set which ruby version to use with RVM
                                  (default: default)
    -h, --help                    Show this help message and exits.
    --version                     Print version and copyright information.
----
test.sh 0.3.0
copyright (c) 2018 Cristian Consonni
MIT License
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
EOF

eval "$(echo "$docstring" | docopts -V - -h - : "$@" )"

# bash strict mode
# See:
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  echo "Loading RVM from home"
  set +eu
  # shellcheck disable=SC1090
  source "$HOME/.rvm/scripts/rvm"
  set -eu

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  echo "Loading RVM from usr/local"
  set +eu
  # shellcheck disable=SC1091
  source "/usr/local/rvm/scripts/rvm"
  set -eu

else

  (>&2 echo "ERROR: An RVM installation was not found.")
  exit 1

fi

# Set the environment by loading from the file "environment" in the base directory
set +eu
DIR="$( cd "$( dirname "$( dirname "$0" )" )" && pwd)"
set -eu

# shellcheck disable=SC1090
source "$DIR/.environment"

echo "== Testing webpage =="

echo ""
echo "Regenerating static files with jekyll"
echo ""
set +eu
rvm use "$ruby_version"
set -eu
echo "Using ruby version $(ruby --version), from $(which ruby)"
jekyll build --drafts --trace

echo ""
echo "Launching standalone server"
echo ""
echo "See http://$TEST_HOSTNAME:$TEST_PORT$TEST_BASEURL/"
echo ""
jekyll serve --config "$TEST_CONFIG" --port "$TEST_PORT" --drafts --watch

echo ""
