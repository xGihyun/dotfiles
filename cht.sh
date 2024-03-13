#!/usr/bin/env bash

programming="$HOME/Documents/Programming"
academics_vault="$HOME/Documents/Obsidian Vault/academics"

folder_list=""

for folder in "$programming"/*; do
	if [ -d "$folder" ]; then
		folder_name=$(basename "$folder")
		folder_list+="$folder_name "
	fi
done

for folder in "$academics_vault"/*; do
	if [ -d "$folder" ]; then
		folder_name=$(basename "$folder")
		folder_list+="$folder_name "
	fi
done

folder_list=${folder_list% }

selected=$(echo "$folder_list" | tr ' ' '\n' | fzf)

if [ -n "$selected" ]; then
	if [ "$TMUX" ]; then
		if [ -d "$programming/$selected" ]; then
			tmux send-keys "cd \"$programming/$selected\"; clear" C-m
		elif [ -d "$academics_vault/$selected" ]; then
			tmux send-keys "cd \"$academics_vault/$selected\"; clear" C-m
		else
			echo "Folder not found."
		fi
	else
		if [ -d "$programming/$selected" ]; then
			tmux new -s "$selected" -c "$programming/$selected"
		elif [ -d "$academics_vault/$selected" ]; then
			tmux new -s "$selected" -c "$academics_vault/$selected"
		else
			echo "Folder not found."
		fi
	fi
else
	echo "No folder selected."
fi
