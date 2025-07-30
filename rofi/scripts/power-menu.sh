#!/bin/sh

chosen=$(printf "󰐥  Power Off\n  Restart\n󰍃  Log Out\n  Lock" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
"󰐥  Power Off") tmux kill-server & poweroff ;;
"  Restart") tmux kill-server & reboot ;;
"󰍃  Log Out") hyprctl dispatch exit ;;
"  Lock") betterlockscreen -l ;;
*) exit 1 ;;
esac
