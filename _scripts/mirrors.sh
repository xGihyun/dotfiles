#!/bin/bash

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --verbose -c HK -c ID -c SG -c TW -c TH -c VN --protocol https --sort rate --latest 20 --download-timeout 5 --threads 8 > /etc/pacman.d/mirrorlist
