#!/bin/bash

for led_dir in /sys/class/leds/input*::scrolllock; do
	if [ -d "$led_dir" ]; then
		sudo sh -c "echo 1 > '$led_dir'/brightness"
	fi
done
