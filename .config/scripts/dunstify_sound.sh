#!/bin/bash

# Récupère le volume actuel en pourcentage à l'aide de pactl
volume=$(pactl list sinks | grep 'Volume' | head -n 1 | awk '{print $5}' | sed 's/%//')

# Affiche la notification avec Dunst
dunstify -h string:x-canonical-private-synchronous:audio -t 1000 "  $volume%" -h int:value:"$volume"
