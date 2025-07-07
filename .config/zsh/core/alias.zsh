OS=$(uname -s)
case ${OS} in
"Linux")
  alias ls='ls --color=auto'
  alias pbcopy='xclip -selection clipboard'
  ;;
"Darwin")
  alias ls='ls --color'
  ;;
esac
alias ll='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias history='history -i'
alias grep='grep --color=auto'
if [ -n "$(which nvim)" ]; then
  alias vim='nvim'
fi

function rgless() {
  rg -p "$@" | less -R
}
