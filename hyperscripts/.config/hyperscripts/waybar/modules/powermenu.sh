#!/bin/bash

lock=" Lock"
log_out="󰍃 Logout"
reboot="󱞺 Reboot"
shutdown=" Power Off"


options="$lock\n$log_out\n$reboot\n$shutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "System" -theme ~/.config/rofi/powermenu.rasi)

case "$chosen" in 
	"$lock")
		hyprlock ;;
	"$log_out")
		hyprctl dispatch exit ;;
	"$reboot")
		systemctl reboot ;;
	"$shutdown")
		systemctl poweroff ;;
esac
