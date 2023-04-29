export PATH="${HOME}/bin:${PATH}"
typeset -U path PATH
# これがあると初期設定ウィザードが起動しない
# でもgitstatusdとかは作ってくれる
target_uname=$(uname -sm | tr '[A-Z]' '[a-z]')
powerlevel10k_path="${HOME}/.local/share/sheldon/repos/github.com/romkatv/powerlevel10k"
export GITSTATUS_CACHE_DIR="$powerlevel10k_path"/gitstatus/usrbin "$powerlevel10k_path"/powerlevel10k/gitstatus/install -f -s "${target_uname% *}" -m "${target_uname#* }"
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
eval "$(sheldon source)"
