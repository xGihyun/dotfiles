#!/bin/bash

backup_dir=/etc/pacman.d/mirrorlist.bak

set -e

echo "Starting mirrorlist update.\n"

echo "Backing up current mirrorlist..."
cp /etc/pacman.d/mirrorlist $backup_dir
echo "Backup created at $backup_dir\n"

echo "Running reflector to find mirrors..."
echo

reflector -c HK,ID,SG,TW,TH,VN \
    --protocol https \
    --sort score \
    --latest 40 \
    --fastest 20 \
    --age 12 \
    --download-timeout 5 \
    --threads 4 \
    --verbose \
    --save /etc/pacman.d/mirrorlist

echo
echo "Done."
