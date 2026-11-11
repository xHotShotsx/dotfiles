-- ---- MONITORS ----

hl.monitor({
    output    = "DP-3",
    mode      = "2560x1440@280",
    position  = "1080x0",
    scale     = 1,
    transform = 1
})

local hdr_on = true

local function apply_dp4()
    hl.monitor({
        output   = "DP-4",
        mode     = "3840x2160@240",
        position = "2520x0",
        scale    = 1.5,
        bitdepth = 10,
        cm       = hdr_on and "hdr" or "srgb",
        sdrbrightness = 1.4,
        sdrsaturation = 1.0,
    })
end

apply_dp4()

hl.bind("SUPER+F10", function()
    hdr_on = not hdr_on
    apply_dp4()
end)

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
    },
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
