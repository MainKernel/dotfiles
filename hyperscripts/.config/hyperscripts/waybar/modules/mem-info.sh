#!/bin/bash

mem_info=$(free -m | grep "Mem:")
mem_total=$(echo $mem_info | awk '{print $2}')
mem_used=$(echo $mem_info | awk '{print $3}')

swap_info=$(free -m | grep "Swap:")
swap_total=$(echo $swap_info | awk '{print $2}')
swap_used=$(echo $swap_info | awk '{print $3}')

mem_total_gb=$(awk "BEGIN {printf \"%.2f\", $mem_total/1024}")
mem_used_gb=$(awk "BEGIN {printf \"%.2f\", $mem_used/1024}")

swap_total_gb=$(awk "BEGIN {printf \"%.2f\", $swap_total/1024}")
if [[ $swap_used == 0 ]]; then
	swap_used_gb=0.0;
else 
	swap_used_gb=$(awk "BEGIN {printf \"%.2f\", $swap_used/1024}")
fi

echo "{\"text\": \"${mem_used_gb}G / ${mem_total_gb}G\", \"tooltip\": \"SWAP: ${swap_used_gb}G / ${swap_total_gb}G\"}"
