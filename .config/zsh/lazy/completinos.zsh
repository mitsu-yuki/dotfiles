#!/usr/bin/env zsh

kubectl() {
  unfunction "$0"
  source <(kubectl completion zsh)
  $0 "$@"
}

helm() {
  unfunction "$0"
  source <(helm completion zsh)
  $0 "$@"
}

f() {
  unfunction "${0}"
  source <(pay-respects zsh --alias)
  "${0}" "${@}"
}

