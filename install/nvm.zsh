#!/usr/bin/env zsh

# setup nvm
if ! which nvm > /dev/null 2>&1;then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  NVM_ENV="/tmp/nvm"
  touch /tmp/nvm
  cat << EOF > ${NVM_ENV}
# nvm env
export NVM_DIR="\$([ -z "\${XDG_CONFIG_HOME-}" ] && printf %s "\${HOME}/.nvm" || printf %s "\${XDG_CONFIG_HOME}/nvm")"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh" # This loads nvm

EOF
  if [ -f "${HOME}/.zshenv" ];then
    mv "${HOME}/.zshenv" "${HOME}/zshenv.bak"
    cat "${HOME}/zshenv.bak" "${NVM_ENV}" > "${HOME}/.zshenv"
  else
    cp "${NVM_ENV}" "${HOME}/.zshenv"
  fi
  rm "${NVM_ENV}"
  source "${HOME}/.zshenv"
else
  echo "nvm is already installed"
fi
nvm install --lts
