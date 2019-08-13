#!/bin/sh

if amixer -c 1 sget Master | grep -q off; then
  amixer -c 1 sset Master unmute
  amixer -c 1 sset Headphone unmute
  amixer -c 1 sset Speaker unmute
else
  amixer -c 1 sset Master toggle
fi
