#!/bin/sh

VALUE=$(cat "/sys/class/leds/input3::scrolllock/brightness")

if [ "${VALUE}" -ne 0 ]; then
	VALUE=0
else
	VALUE=1
fi

echo ${VALUE} >/sys/class/leds/input10::scrolllock/brightness
