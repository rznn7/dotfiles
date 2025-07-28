#!/usr/bin/env bash

# Kill existing bars
polybar-msg cmd quit

BAR="mybar"
LOG="/tmp/polybar_${BAR}.log"

echo "---" | tee -a "$LOG"
(polybar "$BAR" 2>&1 | tee -a "$LOG") &
disown

echo "Bar $BAR launched..."
