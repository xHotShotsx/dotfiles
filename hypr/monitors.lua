-- ---- MONITORS ----

hl.monitor({
    output    = "DP-3",
    mode      = "2560x1440@280",
    position  = "1080x0",
    scale     = 1,
    transform = 1
})

hl.monitor({
    output   = "DP-4",
    mode     = "3840x2160@240",
    position = "2520x0",
    scale    = 1.5
})

hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@100",
    position = "2520x1440",
    scale    = 1
})

-- ---- GAMING FIXES ----

hl.config({
    misc = {
        vrr = 2
    },
    xwayland = {
	force_zero_scaling = true
    }
})

hl.on("hyprland.start", function()
    hl.exec_cmd("xrandr --output DP-4 --primary")
end)

hl.workspace_rule({ workspace = "5", monitor = "DP-4" })

hl.window_rule({
    name       = "games-to-main",
    match      = { class = "^steam_app_.*$" },
    workspace  = "5",
    fullscreen = true,
})
