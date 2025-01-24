#!/usr/bin/env zsh

# kubectl completion
if which kubectl;then
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

f() {
  unfunction "${0}"
  source <(pay-respects zsh --alias)
  "${0}" "${@}"
}

# aws completion
if which aws; then
  autoload -Uz bashcompinit && bashcompinit
  complete -C $(which aws_completer) aws
fi
