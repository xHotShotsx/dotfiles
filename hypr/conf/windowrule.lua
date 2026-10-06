-- ~/.config/hypr/conf/windowrule.lua

-- Smart Gaps / No Gaps When Only One Window Exists
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })

hl.window_rule({
    name = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding = 0
})

hl.window_rule({
    name = "no-gaps-f1",
    match = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding = 0
})

-- Suppress Maximize Requests Layer
local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

-- XWayland Dragging Logic Fix
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
	title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true
})

-- Layer Animation Rule
local overlayLayerRule = hl.layer_rule({
    name = "no-anim-overlay",
    match = { namespace = "^my-overlay$" },
    no_anim = true
})
overlayLayerRule:set_enabled(false)

-- Position Router for Hyprland Run
hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true
})

-- ~/.config/hypr/conf/windowrule.lua

-- (Keep your kitty and rofi opacity rules right above this!)

-- =========================================================================
-- 📺 SOLID MEDIA PLAYER EXCEPTIONS
-- =========================================================================
-- Force video players to render at 100% solid opacity so movies, anime,
-- and streams play without any transparent bleed-through distortion.

hl.window_rule({
    name = "vlc-regex-solid",
    match = { class = "^vlc.*$" },
    opaque = true
})

hl.window_rule({
    name = "mpv-solid-override",
    match = { class = "^mpv.*$" },
    opaque = true
})

