if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Functions

function pg_connect
    set -l pg_name
    set -l pg_pass
    set -l pg_port
    set -l pg_user

    while true
        if not read -P "Enter PostgreSQL database name: " pg_name
            return
        end

        if test -n "$pg_name"
            break
        end

        echo "Database name cannot be empty."
    end

    while true
        if not read -P "Enter PostgreSQL database password: " pg_pass
            return
        end

        if test -n "$pg_pass"
            break
        end

        echo "Database password cannot be empty."
    end

    if not read -P "Enter port (default: 5432): " pg_port
        return
    end

    if not read -P "Enter user: 5432): " pg_user
        return
    end

    if test -z "$pg_port"
        set pg_port 5432
    end

    PGPASSWORD="$pg_pass" psql -U "$pg_user" \
        -h 0.0.0.0 \
        -p "$pg_port" \
        "$pg_name"
end


function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

### Aliases

alias v="nvim"
alias hx="helix"
alias ls="eza"
alias mirrors="sudo $HOME/.config/_scripts/mirrors.sh"
alias pnpx="pnpm dlx"
alias fv="source $HOME/.config/_scripts/cd-fzf.fish"

set -gx EDITOR nvim
set -gx ANDROID_HOME $HOME/Android/Sdk
# set -gx DOCKER_SOCK $HOME/.docker/desktop/docker.sock

fish_add_path "$HOME/zig-linux-x86_64-0.14.0"
#set -gx ANDROID_HOME $HOME/Android/Sdk


### Keybinds

bind \cf "~/.config/_scripts/tmux-sessionizer.sh"

### Others

set fish_greeting
starship init fish | source

zoxide init fish | source
