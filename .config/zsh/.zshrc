typeset -U PATH
export PATH="${HOME}/bin:${PATH}"

# load managed sheldon plugins
if which sheldon > /dev/null 2>&1 ;then
  eval "$(sheldon source)"
fi
