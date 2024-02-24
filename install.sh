#!/usr/bin/env zsh

# dotfiles variables
DOTFILES=$(dirname $0)

# setup zsh and XDG_BASE_DIRECTORY
printf "Setup zsh env (XDG_BASE_DIRECTORY)"
if "${DOTFILES}"/.config/zsh/install.sh ;then
  echo SUCCESS
  source "${HOME}/.zshenv"
else
  failed
  return 0
fi

# install aqua
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.3.0/aqua-installer | bash

# setup cli from aqua
source "${DOTFILES}/.config/zsh/.zshrc"
if which aqua > /dev/null 2>&1 ; then
  aqua install -a
fi
