## Description
Dotfiles and install script to setup an I3-wm environment (including `picom`, `polybar`, `rofi`, `alacritty`, `neovim`, nerd fonts). 
The install script `install.sh` roughly performs the following actions:
1. Update and upgrade packages.
2. Install required and nice-to-have packages (`bat`, `alacritty`).
3. Create dotfiles symlinks to designated location in the filetree with `stow`.
4. Download and install nerd fonts.

This setup was build for, and tested on, a fresh install of Ubuntu Server 24.04 LTS in a VirtualBox VM.
## Instructions
On a fresh install of Ubuntu Server 24.04 LTS:
1. Clone this repo to home dir:
```
git clone https://github.com/CoenAL/.dotfiles ~/.dotfiles
```
2. Run the install script:
```
~/.dotfiles/install.sh
```
3. Apply GTK theme with lxappearance.
