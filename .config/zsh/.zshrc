export PATH="${HOME}/bin:${PATH}"
export PATH=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH
typeset -U path PATH

# load managed sheldon plugins
eval "$(sheldon source)"
