#!/use/bin/env zsh

if which ghq > /dev/null 2>&1; then
  git config --global ghq.root /src/git
else
  echo "ghq not installed. exit."
  exit 1
fi
