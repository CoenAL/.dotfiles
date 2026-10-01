## Info

Repo for my dotfiles + an install script to for a quick I3-wm environment setup (including `picom`, `polybar`, `rofi`, `alacritty`, `neovim`, nerd fonts) using `GNU stow` to manages symlinks.
Installation script `install.sh` was initially created for experimenting with Ubuntu Server 24.04 LTS in a VirtualBox VM.

## Instructions

### 1. Clone this repo to home dir:

```bash
git clone https://github.com/CoenAL/.dotfiles ~/.dotfiles
```

**or**

```bash
git clone git@github.com:CoenAL/.dotfiles.git ~/.dotfiles
```

### 2. install I3-wm environment or stow package specific dotfiles:

#### a. install I3-wm environment
```bash
~/.dotfiles/install.sh
```

And apply GTK theme with lxappearance.

#### b. stow package specific dotfiles

```bash
cd ~/.dotfiles
stow --no-folding nvim lf <etc>
```
