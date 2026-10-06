-- ~/.config/hypr/conf/autostart.lua

hl.on("hyprland.start", function ()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("protonvpn connect")
    hl.exec_cmd("hyprpaper --config ~/.config/hypr/hyprpaper.conf")
    hl.exec_cmd("hyprsunset")
    hl.exec_once("wl-paste --type text --watch cliphist store")
    hl.exec_once("wl-paste --type image --watch cliphist store")
end)
