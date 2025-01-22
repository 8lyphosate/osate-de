#!/usr/bin/env bash

zscroll --delay 0.3 \
		--length 30 \
		--match-command "mpc status" \
		--match-text "" "--before-text ''" \
		--match-text "playing" "--before-text '  '" \
		--match-text "paused" "--before-text '  ' --scroll 0" \
		--update-check true "mpc current" &

wait
