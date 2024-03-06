#!/usr/bin/env bash

# dotfiles variables
INSTALL_DIR=$(dirname $0)/install

run_install_script()
{
  local app="${1}"
  if "${INSTALL_DIR}/${app}.zsh" ;then
    echo "SUCCESS"
    source "${HOME}/.zshenv"
  else
    echo "failed"
    exit 1
  fi
}

run_install_script zsh
run_install_script aqua
run_install_script nvm
run_install_script tmux
