#!/usr/bin/env zsh

GHQ_ROOT="${HOME}/work/git"
# add ghq config
if which ghq > /dev/null 2>&1;then
  mkdir -p "${GHQ_ROOT}"
  git config --global ghq.root "${GHQ_ROOT}"
  unset GHQ_ROOT
else
  echo "ghq is not installed"
  exit 1
fi
