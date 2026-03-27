#!/bin/bash

BASE_DIR="$HOME/.config/wallpapers"

options="⧋ default\n study\n󰌢 software-dev\n engineering\n󰮃 gaming\n relaxing"

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
dunstctl set-paused false                   
killall hyprsunset 2>/dev/null             
hyprctl keyword decoration:dim_inactive 0 

case "$mode" in
	"default")
		hyprctl keyword animations:enabled 1
		hyprctl keyword decoration:blur:enabled 1
		hyprctl keyword decoration:drop_shadow 1
		hyprctl keyword general:gaps_in 5
		hyprctl keyword general:gaps_out 10
		hyprctl keyword decoration:rounding 10
		hyprctl keyword general:col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg"

		;;
	"software-dev")
		hyprctl keyword animations:enabled 1
		hyprctl keyword decoration:blur:enabled 1
		hyprctl keyword misc:vfr 1
		hyprctl keyword general:col.active_border 0 

		hyprctl keyword general:gaps_in 0
    		hyprctl keyword general:gaps_out 0
    		hyprctl keyword decoration:rounding 0
		;;
	"engineering")
		hyprctl keyword animations:enabled 1
		hyprctl keyword decoration:blur:enabled 0 
		hyprctl keyword decoration:shadow:enabled 1
		hyprctl keyword misc:vfr 1
		hyprctl keyword general:col.active_border 0

		hyprctl keyword general:gaps_in 0
		hyprctl keyword general:gaps_out 0 
		hyprctl keyword decoration:rounding 0

		;;
	"gaming")
		hyprctl keyword animations:enabled 0
		hyprctl keyword decoration:blur:enabled 0
		hyprctl keyword decoration:shadow:enabled 0
		hyprctl keyword misc:vfr 0	

		hyprctl keyword general:col.active_border 0
		;;
	"relaxing")
		hyprctl keyword animations:enabled 1
		hyprctl keyword decoration:blur:enabled 1
		hyprctl keyword decoration:drop_shadow 1
		hyprctl keyword general:col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg"


		;;
	"study")
		hyprctl keyword animations:enabled 1
		hyprctl keyword decoration:blur:enabled 1

		hyprctl keyword general:col.active_border 0
		hyprctl keyword decoration:dim_inactive 1
		hyprctl keyword decoration:dim_strength 0.3
		;;
esac	
