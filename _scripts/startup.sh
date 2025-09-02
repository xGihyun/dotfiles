#!/usr/bin/env bash

swaybg -i ~/.config/_wallpapers/kayoko_ny-pixiv-106760656_p0.jpg -m fill &
waybar &
# xwayland-satellite &
mako &
~/.config/_scripts/gammastep-toggle.sh &

disown -a 
