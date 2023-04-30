export PATH="${HOME}/bin:${PATH}"
typeset -U path PATH

# disable powerlevel10k startup wizard
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Assign gitstatusd install dir
export GITSTATUS_CACHE_DIR="${HOME}/.local/share/sheldon/repos/github.com/romkatv/powerlevel10k"
eval "$(sheldon source)"
