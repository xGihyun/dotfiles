#!/usr/bin/env bash

search_paths=(~/ ~/Documents)

display_items=()
data_items=()

while IFS= read -r session; do
    [[ -n $session ]] && display_items+=("󰈺  $session") && data_items+=("session:$session")
done < <(tmux list-sessions -F "#{session_name}" 2>/dev/null)

while IFS= read -r dir; do
    [[ -n $dir ]] && display_items+=("󰉋  $dir") && data_items+=("directory:$dir")
done < <(find "${search_paths[@]}" -mindepth 1 -maxdepth 1 -type d)

selection=$(printf '%s\n' "${display_items[@]}" | fzf)
[[ -z $selection ]] && exit 0

for i in "${!display_items[@]}"; do
    if [[ "${display_items[i]}" == "$selection" ]]; then
        selected_data="${data_items[i]}"
        break
    fi
done

type=${selected_data%%:*}
name=${selected_data#*:}

if [[ $type == "session" ]]; then
    [[ -z $TMUX ]] && tmux attach -t "$name" || tmux switch-client -t "$name"
else
    session_name=$(echo "$name" | tr . _)
    
    if [[ -z $TMUX ]]; then
        tmux new-session -s "$session_name" -c "$dir"
    else
        tmux new-session -ds "$session_name" -c "$dir"
        tmux switch-client -t "$session_name"
    fi
fi
