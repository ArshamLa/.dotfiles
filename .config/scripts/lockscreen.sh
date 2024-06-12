#!/bin/bash


currentworkspace_image="/tmp/currentworkspace.png"

if [ -f "$currentworkspace_image" ]; then
    rm "$currentworkspace_image"
fi

flameshot full -p /tmp/currentworkspace.png
convert /tmp/currentworkspace.png -blur 0x5 /tmp/currentworkspaceblur.png

i3lock -i /tmp/currentworkspaceblur.png

systemctl suspend
