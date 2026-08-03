#!/usr/bin/env zsh

# Completions are pre-generated into $ZDOTDIR/.zfunc by `mise run zsh:regen-completions`
# and picked up via fpath (sheldon [plugins.completion-cache]) by compinit.
# Only the two things that can't live in fpath are handled here.

# aws completion is bash-style (complete -C), not an fpath function.
if (( $+commands[aws] )) && (( $+commands[aws_completer] )); then
  autoload -Uz bashcompinit && bashcompinit
  complete -C aws_completer aws
fi

# git-wt emits a git() wrapper function, not a completion.
if [[ -r "${ZDOTDIR:-$HOME}/.zfunc/git-wt-init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zfunc/git-wt-init.zsh"
fi
