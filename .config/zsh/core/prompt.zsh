#!/usr/bin/env zsh

# LS_COLORS
if which vivid > /dev/null 2>&1;then
  export LS_COLORS=$(vivid generate catppuccin-mocha)
fi

# oh-my-posh
if which oh-my-posh > /dev/null 2>&1;then
  theme="catppuccin"
  setopt prompt_subst # enable command substition in prompt

  function prompt_lite_cmd() {
      oh-my-posh print primary --config "${XDG_CONFIG_HOME}/oh-my-posh/${theme}.lite.omp.json"
  }
  function prompt_full_cmd() {
      oh-my-posh print primary --config "${XDG_CONFIG_HOME}/oh-my-posh/${theme}.omp.json"
  }
  function background_jobs() {
    export BG_JOBS=$(jobs | wc -l | xargs)
  }

  background_jobs
  PROMPT='$(prompt_lite_cmd)'
  ASYNC_PROC=0
  function chpwd() {
      BG_JOBS=$(background_jobs)
      PROMPT='$(prompt_lite_cmd)'
  }

  function precmd() {
    function async() {
      # save to temp file
      background_jobs
      printf "%s" "$(prompt_full_cmd)" > "/tmp/zsh_prompt_$$"
      # signal parent
      kill -s USR1 $$
    }

    # kill child if necessary
    if [[ "${ASYNC_PROC}" != 0 ]]; then
        kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
    fi
    # start background computation
    async &!
    ASYNC_PROC=$!
    [ -z $PRINT_NEW_LINE ] && PRINT_NEW_LINE=1 || echo ""
  }

  function TRAPUSR1() {
    # read from temp file
    PROMPT="$(cat /tmp/zsh_prompt_$$)"
    # remove the temp file
    \rm /tmp/zsh_prompt_$$

    # reset proc number
    ASYNC_PROC=0

    # redisplay
    zle && zle reset-prompt

    # prepare for next
    background_jobs
    PROMPT="$(prompt_lite_cmd)"
  }
fi
