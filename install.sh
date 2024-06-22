#!/bin/bash

# apt update, upgrage and install my packages
sudo apt update && sudo apt upgrade -y
sudo apt install\
	build-essentials\
	feh\
	firefox\
	fzf\
	git\
	gnome-terminal\
	gnome-themes-extra\
	i3\
	lxappearance\
	neovim\
	pcmanfm\
	picom\
	polybar\
	qt5ct\
	ripgrep\
	rofi\
	stow\
	tree\
	unzip\
	xinit\
	-y

# install nerdfonts
mkdir ~/.fonts
cd ~/.fonts
curl -O https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv

# Symlink dotfiles with stow
cd ~/.dotfiles
stow -S --adopt --no-folding\
	bash\
	i3\
	nvim
git restore .
