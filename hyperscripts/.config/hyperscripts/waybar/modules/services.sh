#!/bin/bash

get_status(){
	if systemctl is-active --quiet "$1"; then
		echo "Running"
	else
		echo "Stoped"
	fi
}

docker_status=$(get_status docker)
libvirt_status=$(get_status libvirtd)
bluetooth_status=$(get_status bluetooth)

if [[ "$docker_status" == "Running" ]]; then docker_icon=""; else
docker_icon="󰏤"; fi
if [[ "$libvirt_status" == "Running" ]]; then libvirtd_icon=""; else libvirtd_icon="󰏤"; fi
if [[ "$bluetooth_status" == "Running" ]]; then	bluetooth_icon=""; else bluetooth_icon="󰏤"; fi


options="$docker_icon Docker\n$libvirtd_icon Libvirt\n$bluetooth_icon Bluetooth"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Services" -theme ~/.config/rofi/services.rasi)

toggle_switch(){
	if systemctl is-active --quiet "$1"; then
		systemctl stop "$1"
		notify-send -t 2000 -u low "Services" "$1 stoped"
	else
		systemctl start "$1"
		notify-send -t 2000 -u low "Services" "$1 running"
	fi
}

case "$chosen" in
	*"Docker"*)
		toggle_switch docker ;;
	*"Libvirt"*)
		toggle_switch libvirtd ;;
	*"Bluetooth"*)
		toggle_switch bluetooth ;;
esac
