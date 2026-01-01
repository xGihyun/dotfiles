#!/usr/bin/env bash

swaybg -i ~/.config/_wallpapers/kazusa-503213-edited.png -m fill &
waybar &
# xwayland-satellite &
mako &
~/.config/_scripts/gammastep-toggle.sh &

disown -a 
