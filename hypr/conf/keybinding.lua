-- 🪟 CORE SYSTEM & WINDOW CONTROLS
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd("kitty")) -- Swap "kitty" if you use another terminal
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + M", hl.dsp.exit())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + SHIFT + B", function()
    hl.dispatch(hl.dsp.exec_cmd("killall -USR1 waybar"))
end)
hl.bind("SUPER + ALT + CTRL + B", function()
    hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))
end)
-- Press SUPER + S to hide (minimize) the active window into the minimized scratching pool
hl.bind("SUPER + SHIFT + ALT + D", function()
    hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized" }))
end)

-- Press SUPER + A to toggle the minimized window layer right back on screen!
hl.bind("SUPER + ALT + D", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("minimized"))
end)

hl.bind("SUPER + CTRL + S", function()
    hl.dispatch(hl.dsp.exec_cmd("hyprsunset --temperature 4500 --gamma 75"))
end)
hl.bind("SUPER + CTRL + K", function()
    hl.dispatch(hl.dsp.exec_cmd("pkill hyprsunset"))
end)

hl.bind("ALT + F4 + RETURN", hl.dsp.exec_cmd("poweroff"))
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("reboot"))

-- 🎯 TARGETING YOUR PERFORMANCE GAMEMODE TOGGLE
if toggle_gamemode then
    hl.bind("SUPER + F1", toggle_gamemode)
end

-- 🗔 FOCUS DIRECTIONS (Super + Arrow Keys)
hl.bind("SUPER + Left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = tostring(i % 10)
    local ws  = tostring(i)

    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = ws, on_current_monitor = true }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws }))
end

-- 🖱️ FIXED MOUSE DRAGGING & RESIZING
-- Standard hl.bind handles mouse operations by declaring the { mouse = true } parameter block!
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- 🌐 MULTI-LANGUAGE KEYBOARD TOGGLE
hl.bind("ALT + SHIFT", function()
    hl.dispatch(hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
end)

-- 🔊 MULTIMEDIA KEYS (Audio & Brightness controls)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true })

-- 🎵 MEDIA TRACK CONTROLS (Requires playerctl tool installed)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- 🌐 THE EXPLICIT LUA MULTI-LANGUAGE LAYOUT ROUTER
-- Define your polyglot array in the exact target order (0-indexed for Hyprland's engine)
local layouts = { "gb", "ara", "ru", "gr", "il", "in", "pk" }
local current_layout_index = 0 -- Starts at 'gb'

hl.bind("ALT + SHIFT", function()
    -- Advance to the next layout index in the matrix loop
    current_layout_index = current_layout_index + 1
    if current_layout_index >= #layouts then
        current_layout_index = 0 -- Reset back to 0 (gb) once it hits the end
    end
    
    -- Pick out the exact language code string
    local target_lang = layouts[current_layout_index + 1]
    
    -- Construct the exact command targeting your physical keyboard layout engine
    -- This forces the compositor to shift your device state explicitly
    local switch_cmd = "hyprctl switchxkblayout all " .. tostring(current_layout_index)
    
    -- Fire the call directly into the compositor thread
    hl.dispatch(hl.dsp.exec_cmd(switch_cmd))
    
    -- OPTIONAL LOGGING: Un-comment the line below if you want to trace it in 'hyprctl logger'
    -- print("Language manually routed to: " .. target_lang .. " (Index: " .. current_layout_index .. ")")
end)

-- MISC.
hl.bind("SUPER + F12", hl.dsp.exec_cmd("hyprshot -m region -m active --clipboard-only"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -z --clipboard-only"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"), { locked = true })
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + I", hl.dsp.exec_cmd("systemsettings"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("discord"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
