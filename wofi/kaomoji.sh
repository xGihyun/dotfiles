#!/usr/bin/env bash

selection=$(wofi -i -dmenu $@ <$(dirname $0)/kaomoji.txt)
kaomoji=$(echo $selection | sed "s|$(echo -e "\ufeff").*||")
echo -n "$kaomoji" | wl-copy
