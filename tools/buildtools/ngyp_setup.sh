#!/usr/bin/env bash
#
# purpose:
# this script install node-gyp
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_DIR/../../utils/common.sh"

root_check

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if [ -z $(get_version "node -v") ] && \
    [ -z $(get_version "nvm --version") ]; then
    echo "node must be installed"
    exit 1
fi

if [ -z $(get_version "nvm --version") ]; then
    nvm install 9.0.0
    nvm use 9.0.0
fi

set -e

# install node-gyp
npm install -g node-gyp

if [ -z $(get_version "node-gyp --version") ]; then
    exit 1
fi
