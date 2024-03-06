#!/usr/bin/env bash

# dotfiles variables
DOTFILES=$(dirname $0)

# setup zsh and XDG_BASE_DIRECTORY
printf "Setup zsh env (XDG_BASE_DIRECTORY)"
if "${DOTFILES}"/.config/zsh/install.sh ;then
  echo SUCCESS
  source "${HOME}/.zshenv"
else
  failed
  exit 1
fi

# install aqua
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.3.0/aqua-installer | bash

# setup cli from aqua
source "${DOTFILES}/.config/zsh/.zshrc"
if which aqua > /dev/null 2>&1 ; then
  aqua install -a
fi

# setup nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
NVM_ENV="/tmp/nvm"
touch /tmp/nvm
cat << EOF > ${NVM_ENV}
# nvm env
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

EOF
if [ -f "${HOME}/.zshenv" ];then
  mv "${HOME}/.zshenv" "${HOME}/zshenv.bak"
  cat "${HOME}/zshenv.bak" "${NVM_ENV}" > "${HOME}/.zshenv"
else
  cp "${NVM_ENV}" "${HOME}/.zshenv"
fi
rm "${NVM_ENV}"
source "${HOME}/.zshenv"
. "${NVM_DIR}/nvm.sh"
nvm install --lts
