#!/bin/bash

echo " Installation start..."

cd "$(dirname "$0")"

sudo pacman -Syu --noconfirm

if [[ -f "pkglist.txt" ]]; then
	sudo pacman -S --needed --noconfirm - < pkglist.txt
fi

if ! command -v yay &> /dev/null; then
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si --noconfirm
	cd -
fi

if [[ -f "aurlist.txt " ]]; then
	yay -S --needed --noconfirm - < aurlist.txt
fi

stow hyperscripts
stow kitty
stow anyrun
stow rofi
stow waybar
stow hyprland

echo "✓ System ready."
