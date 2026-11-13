#!/bin/sh
# ~/.config/sway/gamemode.sh
# Port of toggle_gamemode() from hypr/functions.lua: first press removes
# gaps and transparency; second press restores the config values.

flag="${XDG_RUNTIME_DIR:-/tmp}/sway-gamemode"

if [ -e "$flag" ]; then
    rm -f "$flag"
    swaymsg -q 'gaps inner all set 12'
    swaymsg -q '[tiling] opacity 0.95'
    swaymsg -q '[floating] opacity 0.95'
    swaymsg -q '[app_id="^(mpv|vlc)"] opacity 1'
    swaymsg -q '[class="^(mpv|vlc)"] opacity 1'
else
    : > "$flag"
    swaymsg -q 'gaps inner all set 0'
    swaymsg -q '[tiling] opacity 1'
    swaymsg -q '[floating] opacity 1'
fi
