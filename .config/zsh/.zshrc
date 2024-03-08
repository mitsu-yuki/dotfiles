typeset -U PATH
export PATH="${HOME}/bin:${PATH}"
export PATH=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH
export AQUA_GLOBAL_CONFIG=${AQUA_GLOBAL_CONFIG:-}:${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml


# load managed sheldon plugins
if which sheldon > /dev/null 2>&1 ;then
  eval "$(sheldon source)"
fi
