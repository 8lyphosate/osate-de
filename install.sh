#!/bin/bash
sudo pacman -S i3 polybar picom rofi alacritty dunst ly mpd ncmpcpp fastfetch bashtop networkmanager ttf-iosevka-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono ueberzug conky feh nitrogen cups
yay -S spotify clifm mpdris2 zscroll-git

mkdir ~/Pictures/
cp -rf ./src/default-wallpaper.jpg ~/Pictures/
cp -rf ./src/.config ~/
cp -rf ./src/.ncmpcpp ~/

systemctl --user enable mpDris2.service
systemctl --user enable mpd.service
systemctl enable ly.service
systemctl enable NetworkManager.service
systemctl enable cups.service

systemctl start ly.service

nitrogen --set-auto ~/Pictures/default-wallpaper.jpg
