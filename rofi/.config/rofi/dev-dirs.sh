#!/usr/bin/env bash

DEV_DIR="$HOME"
choice=$(find "$DEV_DIR" -mindepth 1 -maxdepth 2 -type d -name '.*' -prune -o -type d -printf '%P\n' | sort | rofi -dmenu -i -p "dev")
[ -z "$choice" ] && exit 0
exec wezterm start --cwd "$DEV_DIR/$choice"
