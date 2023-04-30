OS=$(uname -s)
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias vim='nvim'
case ${OS} in
  "Linux")
    alias ls='ls --color=auto';;
  "Darwin")
    alias ll='ls -la';;
esac
