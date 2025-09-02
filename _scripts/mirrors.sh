#!/bin/bash

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c HK,ID,SG,TW,TH,VN \
    --protocol https \
    --sort score \
    --latest 40 \
    --fastest 20 \
    --age 12 \
    --download-timeout 5 \
    --threads 4 \
    --save /etc/pacman.d/mirrorlist
