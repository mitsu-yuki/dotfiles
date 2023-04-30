export PATH="${HOME}/bin:${PATH}"
typeset -U path PATH

# disable powerlevel10k startup wizard
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Assign gitstatusd install dir
export GITSTATUS_CACHE_DIR="${HOME}/.local/share/sheldon/repos/github.com/romkatv/powerlevel10k"

# load managed sheldon plugins
eval "$(sheldon source)"

# Warp is NOT SUPPORT powerlevel10k
P10K_CONFIG_PATH="${HOME}/dotfiles/zsh/.p10k.zsh"
if [ "${TERM_PROGRAM}" = "WarpTerminal" ];then
  eval "$(starship init zsh)"
else
  [ -f ${P10K_CONFIG_PATH} ] && source ${P10K_CONFIG_PATH}
fi
