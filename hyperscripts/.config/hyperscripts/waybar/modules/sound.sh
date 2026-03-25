#!/bin/bash

volume=$(pamixer --get-volume)
is_muted=$(pamixer --get-mute)

if [ "$is_muted" = "true" ]; then
    echo "{\"text\": \"󰝟 $volume%\"}"
else
    echo "{\"text\": \"󰕾 $volume%\"}"
fi
