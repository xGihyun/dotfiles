#!/usr/bin/env fish

if test (count $argv) -eq 1
    set selected $argv[1]
else
    set selected (find ~/ ~/Development ~/Documents ~/Documents/Academics ~/Documents/Notes -mindepth 1 -maxdepth 1 -type d | fzf)
end

if test -n "$selected"
    cd "$selected"
end
