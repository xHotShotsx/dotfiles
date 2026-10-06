-- ~/.config/hypr/conf/autostart.lua

hl.on("hyprland.start", function ()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("protonvpn connect")
    hl.exec_cmd("linux-wallpaperengine --fps 60 --scaling fill --screen-root DP-3 --bg 1642738985")
    hl.exec_cmd("linux-wallpaperengine --fps 60 --scaling fill --screen-root DP-4 --bg 1611406045")
    hl.exec_cmd("linux-wallpaperengine --fps 60 --scaling fill --screen-root DP-2 --bg 1799666057")
end)

