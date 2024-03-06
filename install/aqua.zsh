#!/usr/bin/env zsh

# install aquia
if ! which aqua > /dev/null 2>&1;then
  curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.3.0/aqua-installer | bash
fi

# setup AQUA_GLOBAL_CONFIG
if [ -z "${AQUA_GLOBAL_CONFIG}" ];then
  source "${DOTFILES}/.config/zsh/.zshrc"
fi

# setup managed aqua applications
if which aqua > /dev/null 2>&1 ; then
  aqua install -a
fi

