#!/usr/bin/env zsh

emulate -L zsh
setopt local_options no_unset

local cache_dir="${ZDOTDIR:-$HOME}/.zfunc"
mkdir -p "$cache_dir"
rm -f "$cache_dir"/_*(N) "$cache_dir"/git-wt-init.zsh(N)

(( $+commands[mise] ))    && mise completion zsh                > "$cache_dir/_mise"
(( $+commands[kubectl] )) && kubectl completion zsh             > "$cache_dir/_kubectl"
(( $+commands[docker] ))  && docker completion zsh              > "$cache_dir/_docker"
(( $+commands[fd] ))      && fd --gen-completions zsh           > "$cache_dir/_fd"
(( $+commands[rg] ))      && rg --generate complete-zsh         > "$cache_dir/_rg"
(( $+commands[helm] ))    && helm completion zsh                > "$cache_dir/_helm"
(( $+commands[gh] ))      && gh completion -s zsh               > "$cache_dir/_gh"
(( $+commands[glab] ))    && glab completion -s zsh             > "$cache_dir/_glab"
(( $+commands[gc] ))      && gc completion zsh                  > "$cache_dir/_gc"
(( $+commands[restic] ))  && restic generate --zsh-completion - > "$cache_dir/_restic"
if (( $+commands[rustup] )); then
  rustup completions zsh       > "$cache_dir/_rustup"
  rustup completions zsh cargo > "$cache_dir/_cargo"
fi

# git-wt emits a git() wrapper, not a completion, so it can't live in fpath.
if mise which git-wt >/dev/null 2>&1 || (( $+commands[git-wt] )); then
  git wt --init zsh > "$cache_dir/git-wt-init.zsh"
fi

touch "$cache_dir/.last-gen"
rm -f "${ZDOTDIR:-$HOME}/.zcompdump"(N) "${ZDOTDIR:-$HOME}/.zcompdump.zwc"(N)
print -r -- "completions regenerated into $cache_dir"
