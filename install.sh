#!/usr/bin/env zsh

# dotfiles variables
DOTFILES=$(dirname $0)

# setup zsh and XDG_BASE_DIRECTORY
"${DOTFILES}"/.config/zsh/install.sh

# install aqua
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.3.0/aqua-installer | bash
