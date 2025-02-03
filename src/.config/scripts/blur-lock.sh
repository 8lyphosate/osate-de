#!/bin/bash

# Take a screenshot
scrot /tmp/screen.png

# Blur the image (adjust 5x5 for more or less blur)
convert /tmp/screen.png -blur 30x15 /tmp/screen_blur.png
convert /tmp/screen_blur.png -fill black -colorize 40% /tmp/screen_dim.png

# Lock the screen with the blurred image
i3lock -i /tmp/screen_dim.png \
	--inside-color=#19172400 \
	--ring-color=#e0def443 \
	--line-color=#00000000 \
	--keyhl-color=#e0def4 \
	--bshl-color=#26233a \
	--separator-color=#00000000 \
	--verif-color=#e0def4 \
	--insidever-color=#e0def400 \
	--ringver-color=#e0def443 \
	--wrong-color=#e0def4 \
	--insidewrong-color=#eb6f9200 \
	--ringwrong-color=#eb6f9243 \
	--time-str="%H:%M:%S" \
	--date-str="%A, %B %d" \
	--time-color=#e0def4 \
	--date-color=#e0def4 \
	--time-font="Iosevka Nerd Font" \
	--date-font="Iosevka Nerd Font" \
	--clock \
	--nofork \
	--pass-media-keys \
	--pass-screen-keys \
	--pass-power-keys \
	--pass-volume-keys \
	--radius 135 \ # 90

# Remove temporary images after unlocking
rm /tmp/screen.png /tmp/screen_blur.png /tmp/screen_dim.png
