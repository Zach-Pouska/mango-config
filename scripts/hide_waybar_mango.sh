#!/usr/bin/bash

startd=$(pgrep -x waybar)

if [ -n "$startd" ]; then
	pkill -x waybar & 
else
	waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css &
fi
