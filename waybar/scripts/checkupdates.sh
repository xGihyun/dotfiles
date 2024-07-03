#!/bin/bash

pacman_updates=$(checkupdates 2>/dev/null | wc -l)

aur_helper="yay"  
aur_updates=$("$aur_helper" -Qua 2>/dev/null | wc -l)

total_updates=$((pacman_updates + aur_updates))

if [ $total_updates == 1 ]; then
    echo -n "󰇚 1 Update"
elif [ $total_updates -gt 1 ]; then
    echo -n "󰇚 $total_updates Updates"
fi
