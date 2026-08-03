#!/usr/bin/env zsh
# Pre-generate shell completions into $ZDOTDIR/.zfunc.
# Run with `mise run zsh:regen-completions` (e.g. after installing/updating a tool).
# To add a tool: add one line below. fpath-style completions must be written
# as "_<command>"; they are registered at shell startup by lazy/completions.zsh.

setopt no_unset extended_glob

cache_dir="${0:A:h:h}/.zfunc"
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

# git-wt emits a git() wrapper function, not a completion, so it can't live in fpath.
if (( $+commands[git-wt] )) || mise which git-wt >/dev/null 2>&1; then
  git wt --init zsh > "$cache_dir/git-wt-init.zsh"
fi

# drop sheldon-compinit's dump so the next shell re-indexes the new set
# (only ours: Ubuntu's global compinit owns the plain .zcompdump)
rm -f "${cache_dir:h}/.zcompdump-user"(N)

print -r -- "completions regenerated into $cache_dir"
