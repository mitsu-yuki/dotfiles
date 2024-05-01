#!/usr/bin/env zsh

# install tpm (tmux plugin manager)
if [ -z "${XDG_CONFIG_HOME}" ];then
  source ~/.zshenv
fi

git clone https://github.com/tmux-plugins/tpm.git "${XDG_DATA_HOME}/tmux/plugins/tpm"
