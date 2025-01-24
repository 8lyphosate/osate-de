#!/bin/bash
sudo pacman -S i3 polybar picom rofi alacritty dunst ly mpd ncmpcpp fastfetch bashtop networkmanager ttf-iosevka-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ueberzug conky feh nitrogen cups
yay -S spotify clifm mpdris2

cp -rf ./src/default-wallpaper.jpg ~/Pictures/
cp -rf ./src/.config ~/
cp -rf ./src/.ncmpcpp ~/

nitrogen --set-auto ~/Pictures/default-wallpaper.jpg

systemctl --user enable mpDris2.service
systemctl --user enable mpd.service
systemctl enable ly.service
systemctl enable NetworkManager.service
systemctl enable cups.service

i3-msg reload
