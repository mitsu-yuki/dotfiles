HOME := $(shell echo $HOME)
DOTFILES_DIR := $(HOME)/dotfiles
DOTFILES_ZSH_DIR := $(DOTFILES_DIR)/zsh

# dotfiles path
DOTFILES_ZSH_DIR := $(DOTFILES_DIR)/zsh
SYM_ZSHRC := $(HOME)/.zshrc

# sheldin path
SHELDON_DEFAULT_DIR := $(HOME)/.config/sheldon
SYM_SHELDON_TOML := $(SHELDON_DEFAULT_DIR)/plugins.toml
.PHONY: init

init: $(SYM_ZSHRC) $(SYM_SHELDON_TOML)

$(SYM_ZSHRC):
	ln -s $(HOME)/.zshrc $(DOTFILES_ZSH_DIR)/zshrc

$(SYM_SHELDON_TOML): $(SHELDON_DEFAULT_DIR)
	ln -s $(SHELDON_DEFAULT_DIR)/plugins.toml $(DOTFILES_ZSH_DIR)/sheldon_plugins.toml

$(SHELDON_DEFAULT_DIR):
	mkdir -p $(SHELDON_DEFAULT_DIR)
