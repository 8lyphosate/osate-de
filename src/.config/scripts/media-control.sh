#!/bin/bash
if ! playerctl -l | grep -c mpd; then
	playerctl -p spotify,firefox,mpv "$1"
elif [[ "$1" == "play-pause" ]]; then
	mpc toggle
else
	mpc "$1"
fi
