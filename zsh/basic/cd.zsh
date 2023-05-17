DIRSTACKSIZE=11
setopt AUTO_PUSHD
setopt PUSHED_IGNORE_DUPS
setopt pushdminus

autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
