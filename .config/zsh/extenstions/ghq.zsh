#!/usr/bin/env zsh

# add ghq original extensions
# ref: https://gist.github.com/sheepla/d680f1480d8c36c4290d6aabebf1abc6 (base script)
# ref: https://zenn.dev/eetann/articles/2022-08-27-fzf-preview (fzf option)
ghq()
{
  if [ "${1}" = "cd" ];then
    local root repo dir
    root="$(ghq root)"
    repo=$(ghq list | fzf --preview "printf '%s\n\n' {} ;ls ${root}/{}" --reverse --height=50%)
    dir="${root}/${repo}"
    [ -d "${dir}" ] && cd "${dir}"
  else
    command ghq "${@}"
  fi
}
