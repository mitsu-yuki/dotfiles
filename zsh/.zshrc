export PATH="${HOME}/bin:${PATH}"
typeset -U path PATH

# load managed sheldon plugins
eval "$(sheldon source)"
