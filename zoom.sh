#!/usr/bin/env bash

case "$1" in
  "in")
    xrandr --output eDP1 --scale 0.75x0.75
    ;;
  "out")
    xrandr --output eDP1 --scale 1x1
    ;;
  *)
    exit 0
    ;;
esac
