#!/usr/bin/env bash

dir="$HOME/.config/_audio/"

file=$(find "$dir" -type f -iname "*.wav" -print0 | shuf -zn1 | tr -d '\0')
if [[ -n $file ]]; then
    ffplay -nodisp -volume 25 -autoexit "$file" & disown
else
    echo "No WAV files found in $dir." >&2
    exit 1
fi
