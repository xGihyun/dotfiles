#!/usr/bin/env fish

set binaural_beat_file ~/Music/binaural-beat.opus

if pgrep -x "vlc" > /dev/null
    pkill -x "vlc"
else
    cvlc --gain=0.20 "$binaural_beat_file" -R & disown
end
