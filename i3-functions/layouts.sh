#!/usr/bin/env bash

case "$1" in
  "default")
    xrandr --output eDP --mode 2560x1440
    xrandr --output DisplayPort-6 --off
    xrandr --output DisplayPort-7 --off
    xrandr --output HDMI2 --off
    ;;
  "laptop")
    xrandr --output eDP --mode 1920x1080
    xrandr --output DisplayPort-6 --off
    xrandr --output DisplayPort-7 --off
    xrandr --output HDMI2 --off
    ;;
  "twoscreens")
    xrandr --output eDP --off
    xrandr --output DisplayPort-7 --auto --primary
    xrandr --output DisplayPort-6 --auto --left-of DisplayPort-7 --rotate right
    xrandr --output DisplayPort-7 --pos 1440x560

    i3-msg "workspace number 1, move workspace to output DisplayPort-7"
    i3-msg "workspace number 2, move workspace to output DisplayPort-7"
    i3-msg "workspace number 3, move workspace to output DisplayPort-7"
    i3-msg "workspace number 4, move workspace to output DisplayPort-6"
    ;;
  "onescreen")
    xrandr --output HDMI2 --auto --primary
    xrandr --output eDP --off

    i3-msg "workspace number 1, move workspace to output HDMI2"
    i3-msg "workspace number 2, move workspace to output HDMI2"
    i3-msg "workspace number 3, move workspace to output HDMI2"
    i3-msg "workspace number 4, move workspace to output HDMI2"
    ;;
  "presentation")
    xrandr --output eDP --primary --mode 2560x1440
    xrandr --output HDMI2 --auto --above eDP
    ;;
  *)
    exit 0
    ;;
esac
