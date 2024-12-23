typeset -U PATH
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
export AQUA_GLOBAL_CONFIG="${AQUA_GLOBAL_CONFIG:-${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml}"
export GPG_TTY=$(tty)

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

# load mise setting
MISE_PATH="${HOME}/dotfiles/.local/bin/mise"
if [ -f "${MISE_PATH}" ];then
  eval "$("${MISE_PATH}" activate zsh)"
  eval "$("${MISE_PATH}" activate --shims)"
fi

