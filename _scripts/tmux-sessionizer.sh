#!/usr/bin/env bash

SESSION_COLOR=$(tput setaf 2)
DIR_COLOR=$(tput setaf 4)
RESET_COLOR=$(tput sgr0)

search_paths=(~/ ~/documents ~/development)

display_items=()
data_items=()

idx=0
while IFS= read -r session; do
    if [[ -n $session ]]; then
        display_items+=("${idx}|${SESSION_COLOR}${RESET_COLOR}  $session")
        data_items+=("session:$session")
        ((idx++))
    fi
done < <(tmux list-sessions -F "#{session_name}" 2>/dev/null)

while IFS= read -r dir; do
    if [[ -n $dir ]]; then
        display_items+=("${idx}|${DIR_COLOR}󰉋${RESET_COLOR}  $dir")
        data_items+=("directory:$dir")
        ((idx++))
    fi
done < <(find "${search_paths[@]}" -mindepth 1 -maxdepth 1 -type d)

selected_idx=$(printf '%s\n' "${display_items[@]}" | fzf --ansi --delimiter='|' --with-nth=2 --accept-nth=1)
if [[ -z $selected_idx ]]; then
    exit
fi

selected_data="${data_items[selected_idx]}"

type=${selected_data%%:*}
name=${selected_data#*:}
selected_name=$(basename "$name" | tr . _)

if [[ $type == "session" ]]; then
    [[ -z $TMUX ]] && tmux attach -t "$selected_name" || tmux switch-client -t "$selected_name"
    exit 0
fi

session_name=$(echo "$selected_name" | tr . _)

if [[ -z $TMUX ]]; then
    tmux new-session -s "$session_name" -c "$name"
    exit 0
fi

tmux new-session -ds "$session_name" -c "$name"
tmux switch-client -t "$session_name"
