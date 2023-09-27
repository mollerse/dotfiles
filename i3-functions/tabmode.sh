#!/usr/bin/env bash

N=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num')
i3-autolayout tabmode -w $N -f "/tmp/i3-autolayout-tabmode-$N.save"
