#!/bin/bash
sudo pacman -S \
	i3 polybar picom rofi dunst sddm nitrogen \ #essential for desktop
	alacritty firefox discord \ # common apps
	mpd ncmpcpp mpv feh ueberzug \ # media
	fastfetch btop nvim networkmanager tar unzip unrar cups \ # utilities
	ttf-iosevka-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono \ # fonts
	python-distutils-extra python-systemd lm-sensors xorg-serverxorg-apps \ # misc
	fish starship \ # shell
yay -S spotify clifm mpdris2 zscroll-git peaclock

cp -rf ./src/default-wallpaper.png ~/Pictures/
cp -rf ./src/.config ~/
cp -rf ./src/.ncmpcpp ~/

systemctl --user enable mpDris2.service
systemctl --user enable mpd.service
systemctl enable sddm.service
systemctl enable NetworkManager.service
systemctl enable cups.service

systemctl start ly.service
