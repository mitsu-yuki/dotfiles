HOME := $(shell echo $${HOME})
DOTFILES_DIR := $(HOME)/dotfiles
ZSH_DIR := $(DOTFILES_DIR)/zsh
HOME_ZSHRC := $(HOME)/.zshrc
XDG_CONFIG_HOME := $(HOME)/.config
SHELDON_CONFIG := $(CONFIG_HOME)/sheldon

OS := $(shell uname -s)
.PHONY: init test

init: $(HOME_ZSHRC) sheldon

$(HOME_ZSHRC): 
	ln -s $(HOME_ZSHRC) $(ZSH_DIR)/.zshrc

sheldon:
	
