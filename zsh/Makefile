HOME := $(shell echo $HOME)
DOTFILES_DIR := $(HOME)/dotfiles
DOTFILES_ZSH_DIR := $(DOTFILES_DIR)/zsh

SHELDON_DEFAULT_DIR := $(HOME)/.config/sheldon
.PHONY: init

init:
	ln -s $(HOME)/.zshrc $(DOTFILES_ZSH_DIR)/zshrc
	mkdir -p $(SHELDON_DEFAULT_DIR)
	ln -s $(SHELDON_DEFAULT_DIR)/plugins.toml $(DOTFILES_ZSH_DIR)/sheldon_plugins.toml
