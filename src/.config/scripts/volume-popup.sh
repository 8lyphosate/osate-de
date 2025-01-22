#! /bin/bash

if pgrep -x "alsamixer" > /dev/null
then
	killall alsamixer
else
	exec alacritty --class topbar-popup -e alsamixer
fi
