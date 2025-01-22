#! /bin/bash

if pgrep -x "nmtui" > /dev/null
then
	killall nmtui
else
	exec alacritty --class topbar-popup -e nmtui
fi
