#!/bin/sh

if amixer sget Master | grep -q off; then
  amixer sset Master unmute
  amixer sset Headphone unmute
  amixer sset Speaker unmute
else
  amixer sset Master toggle
fi
