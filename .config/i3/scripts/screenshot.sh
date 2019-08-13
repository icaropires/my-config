#!/bin/sh

FOLDER="$HOME/Pictures/Screenshots"
IMG="$FOLDER/$(date '+%Y-%m-%d %H:%M:%S').png"

mkdir -p "$FOLDER" \
  && /usr/bin/maim -s "$IMG" \
  && xclip -selection clipboard -t image/png < "$IMG"
