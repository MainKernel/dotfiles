#!/bin/bash

date=$(~/.config/hyperscripts/hyprlock/date.sh)
time=$(date "+%H:%M")

echo "{\"text\": \"${time}\", \"tooltip\": \"󰃭  ${date} \"}"

