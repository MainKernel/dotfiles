#!/bin/bash

playerctl --follow metadata --format '{"text": "{{artist}} - {{title}}", "tooltip": "{{playerName}}: {{album}}", "class": "{{status}}"}' 2>/dev/null

