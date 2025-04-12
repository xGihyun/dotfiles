if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Functions

function pg_container_start
    set -l container_name
    set -l db_name

    while true
        if not read -P "Enter Docker container name: " container_name
            return
        end

        if test -n "$container_name"
            break
        end

        echo "Container name cannot be empty."
    end

    while true
        if not read -P "Enter PostgreSQL database name: " db_name
            return
        end

        if test -n "$db_name"
            break
        else
            echo "Database name cannot be empty."
        end
    end

    read -P "Enter Docker container name: " container_name
    read -P "Enter PostgreSQL database name: " db_name
    # read -p "Enter Port (default: 5432): " port

    docker run --name "$container_name" \
      -e POSTGRES_PASSWORD=password \
      -e POSTGRES_USER=gihyun \
      -e POSTGRES_DB="$db_name" \
      -p 5432:5432 \
      -d \
      postgres

    echo "PostgreSQL container '$container_name' started."
    echo "To stop and remove the container, use:"
    echo "docker stop $container_name && docker rm $container_name"
end

function pg_connect
    set -l pg_name
    set -l pg_pass
    set -l pg_port

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

    if test -z "$pg_port"
        set pg_port 5432
    end

    PGPASSWORD="$pg_pass" psql -U gihyun \
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

#fish_add_path "$HOME/zig-linux-x86_64-0.14.0-dev.244+0d79aa017"
#fish_add_path "$HOME/zig-linux-x86_64-0.13.0"
#set -gx ANDROID_HOME $HOME/Android/Sdk

### Others

set fish_greeting
starship init fish | source
