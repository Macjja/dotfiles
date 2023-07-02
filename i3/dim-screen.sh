#!/bin/bash

# Bash script to decrease brightness over time using brightnessctl

min_brightness_percent=5
max=$(brightnessctl m)
current=$(brightnessctl g)
min_brightness=$((max/20))

function fade_brightness {
for i in {1..100}
	do
		brightnessctl --min-value=$min_brightness -q s 1%-
		# pkill is used to send a signal to i3blocks to update screen brightness
		pkill -RTMIN+20 i3blocks
		sleep 0.01
	done
}
function set_original {

	original=$(( (current*100)/$max ))%
	brightnessctl --min-value=$min_brightness -q s $original
	pkill -RTMIN+20 i3blocks
}

trap set_original EXIT
fade_brightness
sleep 2147483647
