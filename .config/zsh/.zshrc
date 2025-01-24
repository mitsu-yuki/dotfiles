typeset -U PATH
export GPG_TTY=$(tty)

# load mise setting
MISE_PATH="${HOME}/dotfiles/.local/bin/mise"
if [ -f "${MISE_PATH}" ];then
  eval "$("${MISE_PATH}" activate zsh)"
  eval "$("${MISE_PATH}" activate --shims)"
fi

os_type="$(uname)"
machine_arch="$(uname -m)"
if [ "${os_type}" = "Darwin" ];then
  if [ "${machine_arch}" = "arm64" ];then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ "${machine_arch}" = "x86_64" ];then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# load managed sheldon plugins
if which sheldon > /dev/null 2>&1 ;then
  eval "$(sheldon source)"
fi
