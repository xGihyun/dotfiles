#!/usr/bin/env bash

swaybg -i ~/.config/_wallpapers/hifumi-wallhaven-d6oe2g.png -m fill &
waybar &
# xwayland-satellite &
mako &
~/.config/_scripts/gammastep-toggle.sh &

disown -a 
