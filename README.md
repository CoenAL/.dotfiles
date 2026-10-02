## Description

Dotfiles and install script to setup an I3-wm environment (including `picom`, `polybar`, `rofi`, `alacritty`, `neovim`, nerd fonts).
The install script `install.sh` roughly performs the following actions:

1. Update and upgrade packages.
2. Install required and nice-to-have packages (`bat`, `alacritty`, `fd`, `fzf`).
3. Create dotfiles symlinks with `stow`.
4. Download and install nerd fonts.

This setup was build for, and tested on, a fresh install of Ubuntu Server 24.04 LTS in a VirtualBox VM.

## Instructions

1. Clone this repo to home dir:

```
git clone https://github.com/CoenAL/.dotfiles ~/.dotfiles

# or

git clone git@github.com:CoenAL/.dotfiles.git ~/.dotfiles
```

2. Run the install script:

```
~/.dotfiles/install.sh
```

And apply GTK theme with lxappearance.

**or**

just stow the config that you want:

```
stow --no-folding nvim lf <etc>
```
