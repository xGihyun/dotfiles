#!/usr/bin/env fish

set brown_noise_file ~/Music/brown-noise.mp3

if pgrep -x "vlc" > /dev/null
    pkill -x "vlc"
else
    cvlc "$brown_noise_file" -R & disown
end
