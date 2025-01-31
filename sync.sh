#!/usr/bin/env bash

dest_server="${1}"
dest_path="${HOME}/dotfiles/"

# helper function
copy_to_limit() {
  local src dest
  src="${1}"
  dest="${2}"
  rsync -av --delete --mkpath --bwlimit=12500 "${src}" "${dest_server}:${dest}"
}

copy_to_local_share() {
  local xdg_local_prefix source_path
  xdg_local_prefix=".local/share/"
  source_path="${1}"
  copy_to_limit "${source_path}" "${dest_path}${xdg_local_prefix}"
}

copy_to_local_bin() {
  local xdg_local_prefix source_path
  xdg_local_prefix=".local/bin"
  source_path="${1}"
  copy_to_limit "${source_path}" "${dest_path}${xdg_local_prefix}"
}

# sync dotfiles config
git ls-files -z | rsync -av --delete --files-from=- --from0 . "${dest_server}:${dest_path}"

# sync .local/share/xxx directory
copy_to_local_share "./.local/share/nvim"
copy_to_local_share "./.local/share/mise"
copy_to_local_share "./.local/share/sheldon"

# sync .local/bin directory
copy_to_local_bin "./.local/bin/"
