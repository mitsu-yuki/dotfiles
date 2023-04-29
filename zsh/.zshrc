export PATH="${HOME}/bin:${PATH}"
typeset -U path PATH
# これがあると初期設定ウィザードが起動しない
# でもgitstatusdとかは作ってくれる
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
eval "$(sheldon source)"

# TODO: 他のPCに持っていくための処理をどこかでやる
# target_uname=$(uname -sm | tr '[A-Z]' '[a-z]')
# powerlevel10k_path="${HOME}/.local/share/sheldon/repos/github.com/romkatv/powerlevel10k"
# GITSTATUS_CACHE_DIR="$powerlevel10k_path"/gitstatus/usrbin "$powerlevel10k_path"/gitstatus/install -f -s "${target_uname% *}" -m "${target_uname#* }"
