#!/usr/bin/env zsh

# Most completions are pre-generated into $ZDOTDIR/.zfunc and loaded via fpath
# (sheldon [plugins.completion-cache]). Only the non-fpath bits live here.

ZSH_COMPLETION_CACHE="${ZDOTDIR:-$HOME}/.zfunc"

if (( $+commands[aws] )) && (( $+commands[aws_completer] )); then
  autoload -Uz bashcompinit && bashcompinit
  complete -C aws_completer aws
fi

if [[ -r "${ZSH_COMPLETION_CACHE}/git-wt-init.zsh" ]]; then
  source "${ZSH_COMPLETION_CACHE}/git-wt-init.zsh"
fi

# Refresh in the background when the cache is missing or older than a day.
() {
  emulate -L zsh
  setopt local_options extended_glob
  if [[ -z "${ZSH_COMPLETION_CACHE}/.last-gen"(#qN.mh-24) ]]; then
    "${ZDOTDIR:-$HOME}/bin/regen-completions.zsh" >/dev/null 2>&1 &!
  fi
}
