#!/usr/bin/env zsh

# add increment search for history
# ref: https://zenn.dev/nokogiri/articles/ec99e40df54555
_fzf_history()
{
  local buffer
  cmd=$(history -n -r 1 | fzf --reverse --height=50% | cut -d " " -f 4-)
  BUFFER="${cmd}"
  zle reset-prompt
  zle end-of-line
}
zle -N _fzf_history
bindkey '^r' _fzf_history
