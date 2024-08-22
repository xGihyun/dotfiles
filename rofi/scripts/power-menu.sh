#!/bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Hibernate\n󰍃  Log Out\n  Lock" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
"  Power Off") poweroff ;;
"  Restart") reboot ;;
"  Suspend") systemctl suspend-then-hibernate ;;
"  Hibernate") systemctl hibernate ;;
"󰍃  Log Out") hyprctl dispatch exit ;;
"  Lock") betterlockscreen -l ;;
*) exit 1 ;;
esac
