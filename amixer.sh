#!/usr/bin/env bash

CARD=0
CONTROL=Master,0

toggleExtra() {
  if amixer -c 0 sget Master,0 | grep "\[off\]"; then
    amixer -q -c 0 sset Headphone,0 off
    amixer -q -c 0 sset Speaker,0 off
  else
    amixer -q -c 0 sset Headphone,0 on
    amixer -q -c 0 sset Speaker,0 on
  fi
}


case "$1" in
  "raise")
    amixer -q -c $CARD sset $CONTROL 1+ unmute
    ;;
  "lower")
    amixer -q -c $CARD sset $CONTROL 1- unmute
    ;;
  "toggle")
    amixer -q -c $CARD sset $CONTROL toggle
    if [ $CARD -eq 0 ]; then
      toggleExtra
    fi
    ;;
  *)
    exit 0
    ;;
esac
