#!/bin/bash

BASE_DIR="$HOME/.config/wallpapers"

options="⧋ default\n stady\n󰌢 software-dev\n engineering\n󰮃 gaming\n relaxing"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "MODE" -theme ~/.config/rofi/mode-switch.rasi)

mode=$(echo "$chosen" | awk '{print $2}')

if [[ -z "$mode" ]]; then
	exit 0
fi

WALL_DIR="$BASE_DIR/$mode"

if [[ -d "$WALL_DIR" ]]; then
	random_wall=$(find "$WALL_DIR" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg \) | shuf -n 1)
	if [[ -n "$random_wall" ]]; then
		echo "-> Found: $random_wall"
		swww img "$random_wall" --transition-type wipe --transition-angle 30 --transition-step 90
		notify-send -t 2000 -u low "  Mode changed" "Context activated: $mode"
	else
		notify-send -u critical "Wallpaper error" "wallpaper dir $mode is empty!"
	fi
else
	notify-send -u critical "Wallpaper error" "Dir not found $WALL_DIR"
fi


# ========================================================================
# Optimization modes logic
# ========================================================================

case "$mode" in
	"default")
		echo "default"
		;;
	"software-dev")
		echo "software-dev"
		;;
	"engineering")
		echo "engineering"
		;;
	"gaming")
		echo "gaming"
		;;
	"relaxing")
		echo "relaxing"
		;;
	"stady")
		echo "stady"
		;;
esac	
