#!/usr/bin/env bash

N=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num')
i3-input -F "rename workspace to \"$N: %s\"" -P 'New name: '