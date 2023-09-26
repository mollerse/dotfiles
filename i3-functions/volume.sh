#!/usr/bin/env bash
case "$1" in
  "raise")
    pactl set-sink-volume @DEFAULT_SINK@ +1%
    ;;
  "lower")
    pactl set-sink-volume @DEFAULT_SINK@ -1%
    ;;
  "toggle")
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
  *)
    exit 0
    ;;
esac
