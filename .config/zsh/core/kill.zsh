#!/usr/bin/env zsh

zstyle ':completion:*processes' command "ps ax -u $USER"
