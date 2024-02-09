#!/usr/bin/env zsh

DOTFILES="${HOME}/dotfiles"
DOTFILES_ZSH="${DOTFILES}/.config/zsh"
XDG_ENV="${DOTFILES_ZSH}/xdg_env"
if [ ! -f "${XDG_ENV}" ];then
  touch "${XDG_ENV}"
  cat << EOF > "${XDG_ENV}"
export ZDOTDIR='${DOTFILES_ZSH}'
export XDG_CONFIG_HOME='${DOTFILES}/.config'
export XDG_DATA_HOME='${DOTFILES}/.local/share'
EOF
  cat "${XDG_ENV}" "${HOME}/.zshenv" > "${HOME}/.zshenv"
fi
