#!/usr/bin/env zsh

# LS_COLORS
if which vivid >/dev/null 2>&1; then
  export LS_COLORS=$(vivid generate catppuccin-mocha)
fi

# oh-my-posh
# git などの重いセグメントは streaming (config の "streaming") で非同期に描画される
if which oh-my-posh >/dev/null 2>&1; then
  theme="catppuccin"

  # rc 読み込み時点では oh-my-posh が mise の shim に解決され 100ms ほど遅いため、
  # mise の precmd フックで PATH が実体に切り替わった後の初回 precmd で init する
  function _omp_lazy_init() {
    add-zsh-hook -d precmd _omp_lazy_init
    eval "$(oh-my-posh init zsh --config "${XDG_CONFIG_HOME}/oh-my-posh/${theme}.omp.json")"
    add-zsh-hook -d precmd _omp_precmd
    add-zsh-hook precmd _omp_precmd_guard
    _omp_precmd
  }
  add-zsh-hook precmd _omp_lazy_init

  # zsh-defer はタスクごとに precmd フックを再実行する。そのたびに描画すると
  # oh-my-posh のプロンプトカウントが進み、初回プロンプトでも先頭の空行
  # (最初のブロックの "newline") が省略されなくなるため、defer 中は描画しない
  function _omp_return() { return $1 }
  function _omp_precmd_guard() {
    local -a ps=("${pipestatus[@]}")
    (( ${+zsh_defer_options} )) && return ${ps[-1]}
    # _omp_precmd が参照する $? と pipestatus を復元してから呼ぶ
    eval "${(j: | :)${(@)ps/#/_omp_return }}; _omp_precmd"
  }
fi
