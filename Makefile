HOME := $(shell echo $$HOME)

# dotfiles path
# $HOME                             # HOME
# |-- dotfiles                      # DOTFILES_DIR
# |   |-- zsh                       # DOTFILES_ZSH_DIR
# |   |   |-- .zshrc                # DOTFILES_ZSH_ZSHRC
# |   |   |-- starship.toml         # DOTFILES_ZSH_STARSHIP_TOML
# |   |   |-- sheldon_plugins.toml  # DOTFILES_ZSH_SHELDON_TOML
# |   |   `-- (MAKE) sheldon_data   # DOTFILES_ZSH_SHELDON_DATA_DIR
# |   |-- (MAKE) bin                # DOTFILES_BIN_DIR
# |   |-- nvim                      # DOTFILES_NVIM_DIR
# |   |   |-- init.lua              # DOTFILES_NVIM_INIT_FILE
# |   |   `-- cache                 # DOTFILES_NVIM_CACHE_DIR
# |   |       |-- data              # DOTFILES_NVIM_CACHE_DATA_DIR
# |   |       `-- state             # DOTFILES_NVIM_CACHE_STATE_DIR
# |   `-- tmux                      # DOTFILES_TMUX_DIR
# |-- .config
# |   |-- starship.toml # HOME_CONFIG_STARSHIP_TOML
# |   |-- (MAKE)nvim
# |   |   `-- init.lua              # HOME_CONFIG_NVIM_INIT_LUA (symlink to ~/dotfiles/nvim/init.lua)
# |   `-- (MAKE) sheldon
# |       `-- plugins.toml          # HOME_CONFIG_SHELDON_TOML (symlink to ~/dotfiles/zsh/sheldon_plugins.toml)
# |-- .local
# |   |-- (MAKE)share
# |   |   |-- sheldon               # HOME_LOCAL_SHARE_SHELDON_DIR (symlink to ~/dotfiles/zsh/sheldon_data)
# |   |   `-- nvim                  # HOME_LOCAL_SHARE_NVIM_DIR (symlink to ~/dotfiles/nvim/cache/data)
# |   `-- (MAKE)state
# |        `-- nvim                 # HOME_LOCAL_STATE_NVIM_DIR (symlink to ~/dotfiles/nvim/cache/state)
# :
# |-- .zshrc                        # HOME_ZSHRC (symlink to ~/dotfiles/zsh/.zshrc)
# `-- (MAKE)bin                     # HOME_BIN_DIR (add symlink dir)

# $HOME path
DOTFILES_DIR                  := $(HOME)/dotfiles
HOME_BIN_DIR                  := $(HOME)/bin
HOME_ZSHRC                    := $(HOME)/.zshrc
HOME_CONFIG_STARSHIP_TOML     := $(HOME)/.config/starship.toml
HOME_CONFIG_SHELDON_TOML      := $(HOME)/.config/sheldon/plugins.toml
HOME_CONFIG_NVIM_DIR          := $(HOME)/.config/nvim
HOME_LOCAL_STATE_DIR          := $(HOME)/.local/state
HOME_LOCAL_SHARE_NVIM_DIR     := $(HOME)/.local/share/nvim
HOME_LOCAL_STATE_NVIM_DIR     := $(HOME)/.local/state/nvim
HOME_LOCAL_SHARE_SHELDON_DIR  := $(HOME)/.local/share/sheldon

# $HOME/dotfiles
DOTFILES_ZSH_DIR              := $(DOTFILES_DIR)/zsh
DOTFILES_BIN_DIR              := $(DOTFILES_DIR)/bin
DOTFILES_NVIM_DIR             := $(DOTFILES_DIR)/nvim

# $HOME/dotfiles/zsh
DOTFILES_ZSH_ZSHRC            := $(DOTFILES_ZSH_DIR)/.zshrc
DOTFILES_ZSH_STARSHIP_TOML    := $(DOTFILES_ZSH_DIR)/starship.toml
DOTFILES_ZSH_SHELDON_TOML     := $(DOTFILES_ZSH_DIR)/sheldon_plugins.toml
DOTFILES_ZSH_SHELDON_DATA_DIR := $(DOTFILES_ZSH_DIR)/sheldon_data

# $HOME/dotfiles/nvim
DOTFILES_NVIM_CACHE_DIR       := $(DOTFILES_NVIM_DIR)/cache
DOTFILES_NVIM_INIT_FILE       := $(DOTFILES_NVIM_DIR)/init.lua
DOTFILES_NVIM_CACHE_DATA_DIR  := $(DOTFILES_NVIM_CACHE_DIR)/data
DOTFILES_NVIM_CACHE_STATE_DIR := $(DOTFILES_NVIM_CACHE_DIR)/state
.PHONY: init starship

.DEFAULT_GOAL := all
all: zsh nvim
init: mkdir ln
# create symlink for zsh and sheldon
mkdir:
	# make require dir
	mkdir -p $(dir $(HOME_CONFIG_SHELDON_TOML))
	mkdir -p $(dir $(HOME_LOCAL_SHARE_SHELDON_DIR))
	mkdir -p $(HOME_LOCAL_STATE_DIR)
	mkdir -p $(HOME_BIN_DIR)
	mkdir -p $(DOTFILES_ZSH_SHELDON_DATA_DIR)
	mkdir -p $(DOTFILES_BIN_DIR)
	mkdir -p $(DOTFILES_NVIM_CACHE_DIR)
	mkdir -p $(DOTFILES_NVIM_CACHE_DATA_DIR)
	mkdir -p $(DOTFILES_NVIM_CACHE_STATE_DIR)

ln:
	$(call create_symlink,$(DOTFILES_ZSH_ZSHRC),$(HOME_ZSHRC))
	$(call create_symlink,$(DOTFILES_BIN_DIR),$(HOME_BIN_DIR))
	$(call create_symlink,$(DOTFILES_ZSH_SHELDON_DATA_DIR),$(HOME_LOCAL_SHARE_SHELDON_DIR))
	$(call create_symlink,$(DOTFILES_ZSH_SHELDON_TOML),$(HOME_CONFIG_SHELDON_TOML))
	$(call create_symlink,$(DOTFILES_NVIM_DIR),$(HOME_CONFIG_NVIM_DIR))
	$(call create_symlink,$(DOTFILES_NVIM_CACHE_DATA_DIR),$(HOME_LOCAL_SHARE_NVIM_DIR))
	$(call create_symlink,$(DOTFILES_NVIM_CACHE_STATE_DIR),$(HOME_LOCAL_STATE_NVIM_DIR))

zsh: init
	curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to $(value DOTFILES_BIN_DIR)
	$(call create_symlink,$(DOTFILES_BIN_DIR)/sheldon,$(HOME_BIN_DIR)/sheldon)

nvim: init
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

starship:
	$(call create_symlink,$(DOTFILES_ZSH_STARSHIP_TOML),$(HOME_CONFIG_STARSHIP_TOML))

define create_symlink
	$(eval source := $(1))
	$(eval target := $(2))
	if [ ! -s $(target) ];then \
		ln -sf $(source) $(target); \
	fi
endef
