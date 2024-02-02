#!/usr/bin/env zsh

DOTFILES="${HOME}/dotfiles"
DOTFILES_ZSH="${DOTILFES}/.config/zsh"
if [ ! -f "${DOTFILES_ZSH}/.zshenv" ];then
  cat << EOF > "${DOTFILES_ZSH/.zshenv}"
export ZDOTDIR='${DOTFILES_ZSH}'
export XDG_CONFIG_HOME='${DOTFILES}/.config'
export XDG_DATA_HOME='${DOTFILES}/.local/share'
EOF
  cat "${DOTFILES_ZSH}/.zshenv" "${HOME}/.zshenv > "${HOME}/.zshenv"
fi
