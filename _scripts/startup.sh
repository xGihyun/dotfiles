#!/usr/bin/env bash

swaybg -i ~/.config/_wallpapers/kayoko_dress-pixiv-116416657_p0.jpg -m fill &
waybar &
xwayland-satellite &
mako &

disown -a 
