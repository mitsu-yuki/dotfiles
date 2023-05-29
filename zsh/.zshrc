export PATH="${HOME}/bin:${PATH}"
typeset -U path PATH

# Warp is NOT SUPPORT powerlevel10k
P10K_CONFIG_PATH="${HOME}/dotfiles/zsh/.p10k.zsh"
OMP_CONFIG_PATH="${HOME}/dotfiles/zsh/M365Princess.omp.json"

# load managed sheldon plugins
eval "$(sheldon source)"
eval "$(oh-my-posh init zsh --config ${OMP_CONFIG_PATH})"
