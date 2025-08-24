#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
${SCRIPT_DIR}/package_install.sh --nvim-compatible

# setup vscode
cp ${SCRIPT_DIR}/.devcontainer/vscode/* ~/.vscode-remote/data/Machine/
