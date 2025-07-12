#!/usr/bin/env fish

set binaural_beat_file ~/dotfiles-hyprland/_audio/binaural-beat.opus

if pgrep -x "ffplay" > /dev/null
    pkill -x "ffplay"
else
    ffplay -nodisp -volume 10 -loop 0 "$binaural_beat_file" & disown
end
