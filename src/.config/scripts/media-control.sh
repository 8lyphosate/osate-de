#!/bin/bash

if pgrep -x "spotify" > /dev/null 
then
	playerctl -p spotify "$1"
	title=$(playerctl -p spotify metadata title 2>/dev/null || echo "Unknown Title")
	artist=$(playerctl -p spotify metadata artist 2>/dev/null || echo "Unknown Artist")
	album=$(playerctl -p spotify metadata album 2>/dev/null || echo "Unknown Album")
	status=$(playerctl -p spotify status 2>/dev/null || echo "Unknown Status")
	dunstify -a "Now Playing ($status)" "" "$artist - $title\nAlbum: $album"
else
	playerctl -p mpd "$1"
	title=$(playerctl -p mpd metadata title 2>/dev/null || echo "Unknown Title")
	artist=$(playerctl -p mpd metadata artist 2>/dev/null || echo "Unknown Artist")
	album=$(playerctl -p mpd metadata album 2>/dev/null || echo "Unknown Album")
	status=$(playerctl -p mpd status 2>/dev/null || echo "Unknown Status")
	dunstify -a "Now Playing ($status)" "" "$artist - $title\nAlbum: $album"
fi
