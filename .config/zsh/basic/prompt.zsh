#!/usr/bin/env zsh

# LS_COLORS
if which vivid > /dev/null 2>&1;then
  export LS_COLORS=$(vivid generate catppuccin-mocha)
fi

# oh-my-posh
if which oh-my-posh > /dev/null 2>&1;then
  theme_path=$(fd --full-path catppuccin.omp.json "${XDG_DATA_HOME}")
  #eval "$(oh-my-posh init zsh --config ${theme_path})"
fi
