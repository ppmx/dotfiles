#!/bin/bash
#
# No dotfile manager here. Just a simple shell script.
#

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim:
ln -sfnv "${BASEDIR}/awesome" ~/.config/awesome

# vim:
ln -sfnv "${BASEDIR}/vim" ~/.vim

# git:
ln -sfnv "${BASEDIR}/git/gitconfig" ~/.gitconfig

# alacritty:
ln -sfnv "${BASEDIR}/alacritty" ~/.config/alacritty

# picom:
ln -sfnv "${BASEDIR}/picom" ~/.config/picom

# rofi:
ln -sfnv "${BASEDIR}/rofi" ~/.config/rofi

# zathura:
ln -sfnv "${BASEDIR}/zathura" ~/.config/zathura

