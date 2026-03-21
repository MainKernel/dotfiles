#!/bin/bash

status=$(playerctl status 2>/dev/null || echo "Stopped")
title=$(playerctl metadata --format '{{title}}' 2>/dev/null || echo "...")
if [[$status == "Playing"]]; then
	play_pause="󰏤"
else 
	play_pause="󰐊"
fi

options="⏮️\n$play_pause\n⏭️"

choice=$(echo -e "$options" | rofi -dmenu -i -p " $title" -theme ~/.config/rofi/player.rasi -selected-row 1)

case "$choice" in 
	*"⏮️"*) playerctl previous ;;
	*"󰐊"*|*"󰏤"*) playerctl play-pause ;;
	*"⏭️"*) playerctl next ;;
esac
