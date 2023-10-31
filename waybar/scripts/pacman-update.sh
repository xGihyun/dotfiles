#!/usr/bin/env bash

pkgs=$(checkupdates 2>/dev/null | wc -l)

if [ "$pkgs" -eq 0 ]; then
	echo " Updated"
else if [ "$pkgs" == 1 ]
  echo "$pkgs Update"
else
	echo "$pkgs Updates"
fi
