#!/usr/bin/env bash

swaybg -i ~/.config/_wallpapers/manhattan_cafe-wallhaven-d6x2pg-16x9.jpg -m fill &
waybar &
# xwayland-satellite &
mako &
~/.config/_scripts/gammastep-toggle.sh &

disown -a 
