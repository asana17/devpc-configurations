#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

COMMON_DIR="${SCRIPT_DIR}/../common"

source ${SCRIPT_DIR}/../utils.sh

${SCRIPT_DIR}/package_install.sh --nvim-compatible

npm install -g atcoder-cli
pip3 install online-judge-tools

mkdir -p ~/.config/atcoder-cli-nodejs
cp -r ${COMMON_DIR}/comp-prog/atcoder/* ~/.config/atcoder-cli-nodejs/*

# setup vscode
cp ${SCRIPT_DIR}/.devcontainer/vscode/* ~/.vscode-remote/data/Machine/
