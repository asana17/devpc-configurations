#!/bin/bash

pkg_install() {
  sudo apt-get install -y "$@" || FAILED_PKGS+=("$@")
}

non_interactive_pkg_install() {
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y "$@" || FAILED_PKGS+=("$@")
}

error() {
  # if two arguments
  if [ "$#" -eq 2 ]; then
    echo "Failed to install $1: $2" 1>&2
    FAILED_PKGS+=("$1")
  else
    echo "$1" 1>&2
  fi
}

check_install() {
  if [ ${#FAILED_PKGS[@]} -gt 0 ]; then
      echo "The following packages failed to install:"
      printf "%s\n" "${FAILED_PKGS[@]}"
  fi
}
