#!/usr/bin/env zsh

# kubectl completion
if which kubectl; then
  source <(kubectl completion zsh)
fi

# mise completion
if which mise; then
  source <(mise completion zsh)
fi

# helm completion
if which helm; then
  source <(helm completion zsh)
fi

# aws completion
if which aws; then
  autoload -Uz bashcompinit && bashcompinit
  complete -C $(which aws_completer) aws
fi

# github cli completion
if which gh; then
  source <(gh completion -s zsh)
fi

# gc cli completion
if which gc; then
  source <(gc completion zsh)
fi
