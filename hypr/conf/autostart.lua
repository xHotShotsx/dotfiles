-- ~/.config/hypr/conf/autostart.lua

hl.on("hyprland.start", function ()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("protonvpn connect")
    hl.exec_once("wl-paste --type text --watch cliphist store")
    hl.exec_once("wl-paste --type image --watch cliphist store")
end)
