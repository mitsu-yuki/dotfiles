#!/usr/bin/env zsh

# mise completion
if which mise; then
  source <(mise completion zsh)
fi

# kubectl completion
if which kubectl; then
  source <(kubectl completion zsh)
fi

# docker completion
if which docker; then
  source <(docker completion zsh)
fi

# find-fd completion
if which fd; then
  source <(fd --gen-completions zsh)
fi

# ripgrep completion
if which rg; then
  source <(rg --generate complete-zsh)
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

# gitlab cli completion
if which glab; then
  source <(glab completion -s zsh)
fi

# gc cli completion
if which gc; then
  source <(gc completion zsh)
fi

# rust completion
if which rustup; then
  source <(rustup completions zsh)
  source <(rustup completions zsh cargo)
fi

# restic completion
if which restic; then
  source <(restic generate --zsh-completion -)
fi
