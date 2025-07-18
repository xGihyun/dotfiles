#!/usr/bin/env fish

# NOTE: I will probably remove this script soon.

set search_paths ~/ ~/Development ~/Documents ~/Documents/Academics ~/Documents/Notes ~/dotfiles-hyprland ~/Documents/Personal ~/Pictures ~/Videos ~/Music

set selected (find $search_paths \
    -mindepth 1 -maxdepth 1 \
    \( \
        -name "node_modules" -prune \
        -o -name ".cache" -prune \
        -o -name ".git" -prune \
        -o -name ".DS_Store" -prune \
        -o -name "*.log" -prune \
        -o -name "*.tmp" -prune \
    \) -o -print | fzf)

if test -n "$selected"
    if test -d "$selected"
        cd "$selected"
    else
        xdg-open "$selected"
    end
end
