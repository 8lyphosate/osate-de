#! /bin/bash

new_popup() {
	pkill -f "topbar-popup"
	alacritty --class topbar-popup -e "$1"
}

if [[ -z "$1" ]]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

if pgrep -x "$1" > /dev/null; then
	pkill -x "$1"
else
	new_popup "$1"
fi


