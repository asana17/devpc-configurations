#!/bin/zsh

set -e

SCRIPT_DIR=${0:A:h}
COMMON_DIR="${SCRIPT_DIR}/../common"

neovim_install() {
  if command -v nvim &> /dev/null; then
    return
  fi
  brew install neovim
  cp -r ${COMMON_DIR}/nvim ${HOME}/.config/
  if command -v nvim &> /dev/null; then
    nvim +:MasonUpdate +:qall
  fi

  git config --global core.editor "nvim"
}

fish_install() {
  if command -v fish &> /dev/null; then
    return
  fi
  local fish_path="/opt/homebrew/bin/fish"
  brew install fish
  echo "${fish_path}" | sudo tee -a /etc/shells
  sudo chsh -s "${fish_path}"

  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher && fisher update"
}

starship_install() {
  if command -v starship &> /dev/null; then
    return
  fi
  sudo mkdir -p /usr/local/bin
  curl -sS https://starship.rs/install.sh | sh
  cp "${COMMON_DIR}/starship.toml" "${HOME}/.config/starship.toml"
}

fzf_install() {
  if command -v fzf &> /dev/null; then
    return
  fi
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  if ! echo y y y | ~/.fzf/install; then
    error "fzf" "Failed to install fzf"
  fi
}

tmux_install() {
  if command -v tmux &> /dev/null; then
    return
  fi
  cp "${COMMON_DIR}/tmux.conf" "${HOME}/tmux.conf"
}

nerdfont_install() {
  brew install font-fira-code-nerd-font
}

gcc_install() {
  local gcc_full_version
  local gcc_major_version

  brew install gcc

  gcc_full_version=$(ls /opt/homebrew/Cellar/gcc)
  gcc_minor_version= echo "${gcc_full_version}" | sed 's/\..*//'
  sudo ln -s "/opt/homebrew/bin/g++-${gcc_minor_version}" /usr/local/bin/g++

  # To use stdc++.h in clangd
  sudo mkdir -p /usr/local/include/bits
  sudo cp -r "/opt/homebrew/Cellar/gcc/${gcc_full_version}/include/c++/${gcc_minor_version}/aarch64-apple-darwin24/bits/stdc++.h" /usr/local/include/bits/
}

atcoder_setup() {
  pip3 install online-judge-tools
  npm install -g atcoder-cli

  cp "${COMMON_DIR}"/comp-prog/atcoder/* "$(acc-config-dir)/"
  ln -s ~/Library/Python/3.9/bin/oj ~/.local/bin/
  acc config default-task-choice all

  echo "For cli login, see ${COMMON_DIR}/comp-prog/atcoder/README.md"
}

brew install trash-cli tmux ripgrep fd node
fish_install
starship_install
neovim_install
fzf_install
gcc_install
atcoder_setup
