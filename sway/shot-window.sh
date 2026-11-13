#!/bin/sh
# ~/.config/sway/shot-window.sh
# Copy a screenshot of the focused window to the clipboard.
# Needs grim, jq and wl-clipboard.

geom=$(swaymsg -t get_tree |
    jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')

[ -n "$geom" ] && grim -g "$geom" - | wl-copy
