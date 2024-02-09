#!/usr/bin/env zsh

# dotfiles variables
DOTFILES=$(dirname $0)

# setup zsh and XDG_BASE_DIRECTORY
printf "Setup zsh env (XDG_BASE_DIRECTORY)"
if "${DOTFILES}"/.config/zsh/install.sh ;then
  echo SUCCESS
  source "${DOTFILES}/.config/zsh/xdg_env"
else
  failed
  return 0
fi

# install aqua
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.3.0/aqua-installer | bash
