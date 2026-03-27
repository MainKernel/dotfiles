#!/bin/bash

brightness=$(brightnessctl percentage delta | grep "%" | awk '{print $4}' | tr -d "(%)")


#󰃝 󰃞 󰃟 󰃠 

case "$brightness" in
	100|90[0-9]|8[0-9])
		echo "{\"text\": \"󰃠 $brightness\"}"
		;;
	7[0-9]|6[0-9]|5[0-9])
		echo "{\"text\": \"󰃟 $brightness\"}"
		;;
	4[0-9]|3[0-9])
		echo "{\"text\": \"󰃝 $brightness\"}"
		;;
	0|1[0-9]|2[0-9])
		echo "{\"text\": \"󰃞 $brightness\"}"
		;;
	*)	
		echo "{\"text\": \"󰃞 $brightness\"}"
		;;

esac





