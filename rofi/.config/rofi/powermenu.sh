#!/bin/sh

choice=$(printf 'l  lock\ne  logout\ns  suspend\nh  hibernate\nr  reboot\np  poweroff' |
  rofi -dmenu -p "system" \
    -theme ~/.config/rofi/powermenu.rasi \
    -kb-custom-1 "l" \
    -kb-custom-2 "e" \
    -kb-custom-3 "s" \
    -kb-custom-4 "h" \
    -kb-custom-5 "r" \
    -kb-custom-6 "p")

ret=$?

case $ret in
0)
  case "$choice" in
  l*) swaylock -f ;;
  e*) swaymsg exit ;;
  s*) systemctl suspend ;;
  h*) systemctl hibernate ;;
  r*) systemctl reboot ;;
  p*) systemctl poweroff ;;
  esac
  ;;
10) swaylock -f ;;
11) swaymsg exit ;;
12) systemctl suspend ;;
13) systemctl hibernate ;;
14) systemctl reboot ;;
15) systemctl poweroff ;;
esac
