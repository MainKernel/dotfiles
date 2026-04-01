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
stow dunst

sudo systemctl enable sddm
sudo systemctl enable pipewire pipewire-pulse wireplumber
sudo mkdir -p /etc/sddm.conf.d

echo -e "[Theme]\nCurrent=corners" | sudo tee /etc/sddm.conf.d/theme.conf

sudo ln -s /etc/xdg/menus/arch-applications.menu /etc/xdg/menus/applications.menu
kbuildsycoca6
xhost +local:root

hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo
hyprpm reload

echo "✓ System ready."
