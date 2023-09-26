#!/usr/bin/env bash

case "$1" in
  "default")
    xrandr --output eDP1 --mode 2560x1440
    xrandr --output DP1-1 --off
    xrandr --output DP1-2 --off
    xrandr --output HDMI2 --off
    ;;
  "laptop")
    xrandr --output eDP1 --mode 1920x1080
    xrandr --output DP1-1 --off
    xrandr --output DP1-2 --off
    xrandr --output HDMI2 --off
    ;;
  "twoscreens")
    xrandr --output eDP1 --off
    xrandr --output DP1-2 --auto --primary
    xrandr --output DP1-1 --auto --left-of DP1-2 --rotate right
    xrandr --output DP1-2 --pos 1440x560

    i3-msg "workspace 1, move workspace to output DP1-2"
    i3-msg "workspace 2, move workspace to output DP1-2"
    i3-msg "workspace 3, move workspace to output DP1-2"
    i3-msg "workspace 4, move workspace to output DP1-1"
    ;;
  "onescreen")
    xrandr --output HDMI2 --auto --primary
    xrandr --output eDP1 --off

    i3-msg "workspace 1, move workspace to output HDMI2"
    i3-msg "workspace 2, move workspace to output HDMI2"
    i3-msg "workspace 3, move workspace to output HDMI2"
    i3-msg "workspace 4, move workspace to output HDMI2"
    ;;
  "presentation")
    echo "Missing"
    ;;
  *)
    exit 0
    ;;
esac
