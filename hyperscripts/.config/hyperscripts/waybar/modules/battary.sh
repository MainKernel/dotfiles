#!/bin/bash

batt_capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "No such file")

case "$batt_capacity" in
	"No such file") echo "{\"text\": \"󰚥\"}";;
	100|9[5-9]) echo "{\"text\": \" $batt_capacity%\"}";;
	9[0-4]|8[0-9]) echo "{\"text\": \" $batt_capacity%\"}";;
	7[0-9]|6[0-9]) echo "{\"text\": \" $batt_capacity%\"}";;
	5[0-9]|4[0-9]) echo "{\"text\": \" $batt_capacity%\"}";;
	*) echo "{\"text\": \" $batt_capacity%\"}";;

esac
