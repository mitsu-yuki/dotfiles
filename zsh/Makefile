HOME := $(shell echo $$HOME)
DOTFILES_DIR := $(HOME)/dotfiles

# dotfiles path
DOTFILES_ZSH_DIR := $(DOTFILES_DIR)/zsh
DOTFILES_BIN_DIR := $(DOTFILES_DIR)/bin
SYM_ZSHRC := $(HOME)/.zshrc

# sheldin path
SHELDON_CONFIG_DIR := $(HOME)/.config/sheldon
SHELDON_DATA_DIR := $(HOME)/.local/share/sheldon
SYM_SHELDON_TOML := $(SHELDON_CONFIG_DIR)/plugins.toml

# p10k.zsh
SYM_P10K := $(DOTFILES_ZSH_DIR)/.p10k.zsh
.PHONY: init

# create symlink for zsh and sheldon
init: $(SYM_ZSHRC) $(SYM_SHELDON_TOML) install_sheldon
$(SYM_ZSHRC):
	ln -s $(DOTFILES_ZSH_DIR)/zshrc $(HOME)/.zshrc
$(SYM_SHELDON_TOML): $(SHELDON_CONFIG_DIR)
	ln -s $(DOTFILES_ZSH_DIR)/sheldon_plugins.toml $(SHELDON_CONFIG_DIR)/plugins.toml
$(SHELDON_CONFIG_DIR):
	mkdir -p $(SHELDON_CONFIG_DIR)
install_sheldon: $(DOTFILES_BIN_DIR)
	curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to $(DOTFILES_BIN_DIR)

$(DOTFILES_BIN_DIR):
	mkdir -p $(DOTFILES_BIN_DIR)

# for sheldon
sheldon_plugin: $(SHELDON_DATA_DIR)
$(SYM_P10K): $(SYM_SHELDON_TOML)
	ln -s $(SYM_P10K) $(HOME)/.p10k.zsh
