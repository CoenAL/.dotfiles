#!/bin/bash

# apt update, upgrage and install my packages:
sudo apt update && sudo apt upgrade -y
sudo apt install\
	alacritty\
	alsa-base\
	bat\
	build-essential\
	feh\
	firefox\
	fzf\
	gnome-themes-extra\
	i3\
	lsd\
	lxappearance\
	neovim\
	pcmanfm\
	picom\
	polybar\
	pulseaudio\
	qt5ct\
	ripgrep\
	rofi\
	stow\
	unzip\
	xinit\
	-y

# Symlink dotfiles with stow:
cd ~/.dotfiles
stow -S --adopt --no-folding\
	bash\
	i3\
	nvim
git restore .

# Install JetBrainsMono nerdfonts:
cd
mkdir .fonts
cd ~/.fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
cd

# Set GTK theme with lxappearnce
