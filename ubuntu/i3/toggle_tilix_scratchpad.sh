#!/bin/bash

if ! pgrep -x tilix > /dev/null; then
  nohup tilix > /tmp/tilix.log 2>&1 &
  sleep 0.2
fi

WIN_ID=$(xdotool search --onlyvisible --class Tilix | head -n 1)

if [ -n "$WIN_ID" ]; then
    i3-msg "[class=\"Tilix\"] move scratchpad"
    exit 0
fi

i3-msg '[class="Tilix"] scratchpad show; [class="Tilix"] floating enable; focus output primary'

read WIDTH HEIGHT X_OFFSET Y_OFFSET <<< $(xrandr | grep primary | awk '{print $4}' | sed 's/[+x]/ /g')

i3-msg "[class=\"Tilix\"] move to output primary"

i3-msg "[class=\"Tilix\"] focus"

i3-msg "[class=\"Tilix\"] move position $X_OFFSET $Y_OFFSET"

i3-msg "[class=\"Tilix\"] resize set $WIDTH $HEIGHT"
