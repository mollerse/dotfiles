#!/usr/bin/env bash

case "$1" in
  "laptop")
    xrandr --output eDP1 --mode 1920x1080 --primary
    xrandr --output DP1-1 --off
    xrandr --output DP1-2 --off
    xrandr --output HDMI2 --off

    i3-msg "workspace 4, layout tabbed"
    ;;
  "dock")
    xrandr --output eDP1 --off
    xrandr --output DP1-2 --auto --primary
    xrandr --output DP1-1 --auto --right-of DP1-2 --rotate left

    i3-msg "workspace 1, move workspace to output DP1-2"
    i3-msg "workspace 2, move workspace to output DP1-2"
    i3-msg "workspace 3, move workspace to output DP1-2"
    i3-msg "workspace 4, move workspace to output DP1-1"
    i3-msg "workspace 4, layout stacked"
    ;;
  "docklaptop")
    xrandr --output HDMI2 --auto --primary
    xrandr --output eDP1 --mode 1920x1080 --left-of HDMI2

    i3-msg "workspace 1, move workspace to output HDMI2"
    i3-msg "workspace 2, move workspace to output HDMI2"
    i3-msg "workspace 3, move workspace to output HDMI2"
    i3-msg "workspace 4, move workspace to output eDP1"
    ;;
  "presentation")
    echo "Missing"
    ;;
  *)
    exit 0
    ;;
esac

setxkbmap -device 3 -option caps:super -layout us -variant altgr-intl
