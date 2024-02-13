#!/usr/bin/env zsh

DOTFILES="${HOME}/dotfiles"
DOTFILES_ZSH="${DOTFILES}/.config/zsh"
XDG_ENV="${DOTFILES_ZSH}/xdg_env"
if [ -z "${ZDOTDIR}" ];then
  touch "${XDG_ENV}"
  cat << EOF > "${XDG_ENV}"
export ZDOTDIR='${DOTFILES_ZSH}'
export XDG_CONFIG_HOME='${DOTFILES}/.config'
export XDG_DATA_HOME='${DOTFILES}/.local/share'
EOF
  if [ -f "${HOME}/.zshenv" ];then
    mv "${HOME}/.zshenv" "${HOME}/zshenv.bak"
    cat "${XDG_ENV}" "${HOME}/zshenv.bak" > "${HOME}/.zshenv"
  else
    cp "${XDG_ENV}" "${HOME}/.zshenv"
  fi
  rm "${XDG_ENV}"
fi
