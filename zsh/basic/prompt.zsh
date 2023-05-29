setopt prompt_subst # enable command substition in prompt

function prompt_lite_cmd() {
    oh-my-posh print primary --config ~/dotfiles/zsh/M365Princess.lite.omp.json
}

function prompt_full_cmd() {
    oh-my-posh print primary --config ~/dotfiles/zsh/M365Princess.omp.json
}

ASYNC_PROC=0
function precmd() {
    function async() {
        # save to temp file
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

function chpwd() {
  PROMPT='$(prompt_lite_cmd)'
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
    PROMPT="$(prompt_lite_cmd)"
}
