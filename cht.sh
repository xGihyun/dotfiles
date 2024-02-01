#!/usr/bin/env bash

programming="$HOME/Documents/Programming"

if [ -d "$programming" ]; then
	folder_list=""

	for folder in "$programming"/*; do
		if [ -d "$folder" ]; then
			folder_name=$(basename "$folder")
			folder_list+="$folder_name "
		fi
	done

	folder_list=${folder_list% }

	selected=$(echo "$folder_list" | tr ' ' '\n' | fzf)

	if [ -n "$selected" ]; then
		if [ "$TMUX" ]; then
			tmux send-keys "cd \"$programming/$selected\"; clear" C-m
		else
			tmux new -s "$selected" -c "$programming/$selected"
		fi
	else
		echo "No folder selected."
	fi

else
	echo "ERROR: $programming is not a valid directory."
fi
