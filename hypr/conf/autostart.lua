-- ~/.config/hypr/conf/autostart.lua

hl.on("hyprland.start", function ()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("protonvpn connect")
    hl.exec_cmd("hyprctl setcursor GoogleDot-Black 24")
end)
