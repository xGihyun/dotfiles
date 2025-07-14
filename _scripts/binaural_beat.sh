#!/usr/bin/env bash

binaural_beat_file="${HOME}/.config/_audio/binaural-beat.opus"

if pgrep -x "ffplay" > /dev/null; then
    pkill -x "ffplay"
else
    ffplay -nodisp -volume 10 -loop 0 "$binaural_beat_file" & disown
fi
