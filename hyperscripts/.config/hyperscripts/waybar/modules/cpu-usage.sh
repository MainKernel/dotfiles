#!/bin/bash
usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
usage_int=${usage%.*}

case 1 in 
	$((usage_int >= 80))) icon="󰓅";;
	$((usage_int >= 50))) icon="󰾅";;
	*)		      icon="󰾆";;
esac

echo "{\"text\": \"$icon ${usage_int}%\"}"
