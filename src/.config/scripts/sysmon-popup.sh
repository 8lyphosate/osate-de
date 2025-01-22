#! /bin/bash

if pgrep -f "bashtop" > /dev/null
then
	kill $(pgrep -f bashtop)
else
	exec alacritty --class topbar-popup -e bashtop
fi
