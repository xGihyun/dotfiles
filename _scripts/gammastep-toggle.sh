#!/usr/bin/env bash

if pgrep gammastep >/dev/null; then
    pkill gammastep
else
    gammastep -O 4250
fi
