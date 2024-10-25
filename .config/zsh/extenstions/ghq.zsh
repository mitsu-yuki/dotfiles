#!/usr/bin/env zsh

# add ghq original extensions
# ref: https://gist.github.com/sheepla/d680f1480d8c36c4290d6aabebf1abc6 (base script)
# ref: https://zenn.dev/eetann/articles/2022-08-27-fzf-preview (fzf option)
_fzf_cd_ghq()
{
  local root repo dir
  root="$(ghq root)"
  repo=$(ghq list | fzf --preview "printf '%s\n\n' {} ;ls ${root}/{}" --reverse --height=50%)
  if [ -z "${repo}" ];then
    zle reset-prompt
    return 0
  fi
  dir="${root}/${repo}"
  [ -d "${dir}" ] && BUFFER="cd ${dir}"
  zle accept-line
  zle reset-prompt
}

zle -N _fzf_cd_ghq
bindkey "^g" _fzf_cd_ghq
