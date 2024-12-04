#!/usr/bin/env bash

# init value
opend_latest_pr=$(gh api "/repos/mitsu-yuki/dotfiles/pulls" | jq '.[].number')
closed_latest_pr=$(gh api "/repos/mitsu-yuki/dotfiles/pulls?state=closed&per_page=1" | jq '.[].number')

[ -z ${opend_latest_pr} ] && opend_latest_pr=0
[ -z ${closed_latest_pr} ] && closed_latest_pr=0

if [ "${opend_latest_pr}" -gt "${closed_latest_pr}" ];then
  latest_pr_num="${opend_latest_pr}"
else
  latest_pr_num="${closed_latest_pr}"
fi
latest_pr_num=$(( latest_pr_num + 1))
git switch -c "${latest_pr_num}-update"
