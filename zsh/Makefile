HOME := $(shell echo $$HOME)

# dotfiles path
# $HOME                             # HOME
# |-- dotfiles                      # DOTFILES_DIR
# |   |-- zsh                       # DOTFILES_ZSH_DIR
# |   |   |-- .zshrc                # DOTFILES_ZSH_ZSHRC
# |   |   |-- .p10k                 # DOTFILES_ZSH_P10K
# |   |   |-- sheldon_plugins.toml  # DOTFILES_ZSH_SHELDON_TOML
# |   |   `-- (:TODO:) sheldon_data   # DOTFILES_ZSH_SHELDON_DATA_DIR
# |   |-- (TODO:) bin                # DOTFILES_BIN_DIR
# |   |-- nvim                      # DOTFILES_NEOVIM_DIR
# |   `-- tmux                      # DOTFILES_TMUX_DIR
# |-- .config
# |   `-- (TODO:) sheldon
# |       `-- plugins.toml          # HOME_CONFIG_SHELDON_TOML (symlink to ~/dotfiles/zsh/sheldon_plugins.toml)
# |-- .local
# |   `-- (TODO:) share
# |       `-- sheldon               # HOME_LOCAL_SHARE_SHELDON_DIR (symlink to ~/dotfiles/zsh/sheldon_data)
# :
# |-- .zshrc                        # HOME_ZSHRC (symlink to ~/dotfiles/zsh/.zshrc)
# |-- .p10k.zsh                     # HOME_P10K (symlink to ~/dotfiles/zsh/.p10k.zsh)
# |-- bin                           # HOME_BIN_DIR (symlink to ~/dotfiles/bin)

# $HOME path
DOTFILES_DIR                  := $(HOME)/dotfiles
HOME_BIN_DIR                  := $(HOME)/bin
HOME_ZSHRC                    := $(HOME)/.zshrc
HOME_P10K                     := $(HOME)/.p10k.zsh
HOME_CONFIG_SHELDON_TOML := $(HOME)/.config/sheldon/plugins.toml
HOME_LOCAL_SHARE_SHELDON_DIR := $(HOME)/.local/sheldon

# $HOME/dotfiles
DOTFILES_ZSH_DIR              := $(DOTFILES_DIR)/zsh
DOTFILES_BIN_DIR              := $(DOTFILES_DIR)/bin

# $HOME/dotfiles/zsh
DOTFILES_ZSH_ZSHRC            := $(DOTFILES_ZSH_DIR)/.zshrc
DOTFILES_ZSH_P10K             := $(DOTFILES_ZSH_DIR)/.p10k.zsh
DOTFILES_ZSH_SHELDON_TOML     := $(DOTFILES_ZSH_DIR)/sheldon_plugins.toml
DOTFILES_ZSH_SHELDON_DATA_DIR := $(DOTFILES_ZSH_DIR)/sheldon_data
.PHONY: init

init: mkdir ln
# create symlink for zsh and sheldon
mkdir:
	# make require dir
	mkdir -p $(dir $(HOME_CONFIG_SHELDON_TOML))
	mkdir -p $(dir $(HOME_LOCAL_SHARE_SHELDON_DIR))
	mkdir -p $(DOTFILES_ZSH_SHELDON_DATA_DIR)
	mkdir -p $(DOTFILES_BIN_DIR)

ln:
	$(call create_symlink,$(DOTFILES_ZSH_ZSHRC),$(HOME_ZSHRC))
	$(call create_symlink,$(DOTFILES_ZSH_P10K),$(HOME_P10K))
	$(call create_symlink,$(DOTFILES_BIN_DIR),$(HOME_BIN_DIR))
	$(call create_symlink,$(DOTFILES_ZSH_SHELDON_TOML) $(HOME_CONFIG_SHELDON_TOML))

install_sheldon: mkdir
	curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to $(value HOME_BIN_DIR)

define create_symlink
	$(eval source := $(1))
	$(eval target := $(2))
	if [ ! -s $(target) ];then \
		ln -sf $(source) $(target); \
	fi
endef
