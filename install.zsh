#!/usr/bin/env bash

# dotfiles variables
INSTALL_DIR=$(dirname $0)/install
apps=("zsh" "aqua" "nvm" "tmux" "ghq")
run_install_script()
{
  local app="${1}"
  printf "Setup %s\n" "${app}"
  if "${INSTALL_DIR}/${app}.zsh" ;then
    echo "SUCCESS"
    source "${HOME}/.zshenv"
  else
    echo "failed"
    exit 1
  fi
}

for app in "${apps[@]}"
do
  run_install_script "${app}"
done

