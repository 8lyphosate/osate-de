#!/bin/bash
yay -S --needed i3 polybar picom rofi alacritty dunst ly mpd ncmpcpp spotify fastfetch bashtop networkmanager nerd-fonts clifm ueberzug conky feh nitrogen

git clone https://github.com/8lyphosate/osate-de.git ~/osate-de
cp -r ~/osate-de/src/* ~/

chmod -R 755 ~/.config
i3-msg reload
