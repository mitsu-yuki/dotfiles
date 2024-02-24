DIRSTACKSIZE=11
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt pushdminus

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
