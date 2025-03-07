#!/usr/bin/env zsh

if which taplo > /dev/null 2>&1;then
  export TAPLO_CONFIG="${XDG_CONFIG_HOME}/taplo/config.toml"
fi
