#!/usr/bin/env zsh

export MISE_INSTALL_PATH="${HOME}/dotfiles/.local/bin/mise"
if ! which mise > /dev/null 2>&1 ;then
  curl https://mise.run | zsh
  eval_mise="$(mktemp)"
  cat << EOF > "${eval_mise}"
# mise env
eval "\$(${MISE_INSTALL_PATH} activate zsh)"

EOF
  if [ -f "${HOME}/.zshenv" ];then
    mv "${HOME}/.zshenv" "${HOME}/zshenv.bak"
    cat "${HOME}/zshenv.bak" "${eval_mise}" > "${HOME}/.zshenv"
    rm "${HOME}/zshenv.bak"
  else
    cp "${eval_mise}" "${HOME}/.zshenv"
  fi
  rm "${eval_mise}"
  source "${HOME}/.zshenv"
else
  echo "mise is already installed"
fi
