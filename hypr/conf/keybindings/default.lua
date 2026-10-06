-- 🪟 CORE SYSTEM & WINDOW CONTROLS
hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty")) -- Swap "kitty" if you use another terminal
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

-- 🎯 TARGETING YOUR PERFORMANCE GAMEMODE TOGGLE
if toggle_gamemode then
    hl.bind("SUPER + F1", toggle_gamemode)
end

-- 🗔 FOCUS DIRECTIONS (Super + Arrow Keys)
hl.bind("SUPER + Left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down",  hl.dsp.focus({ direction = "down" }))

-- 🔢 AUTOMATED WORKSPACE LOOP (Workspaces 1 to 10)
for i = 1, 10 do
    local key = tostring(i % 10) -- Properly maps workspace 10 to physical '0' key
    
    -- Super + Number: Switch to workspace
    hl.bind("SUPER + " .. key, function() 
        hl.dispatch(hl.dsp.workspace({ workspace = tostring(i) })) 
    end)
    
    -- Super + Shift + Number: Move active window to workspace
    hl.bind("SUPER + SHIFT + " .. key, function() 
        hl.dispatch(hl.dsp.window.move({ workspace = tostring(i) })) 
    end)
end

-- 🖱️ FIXED MOUSE DRAGGING & RESIZING
-- Standard hl.bind handles mouse operations by declaring the { mouse = true } parameter block!
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- 🌐 MULTI-LANGUAGE KEYBOARD TOGGLE
hl.bind("SUPER + SPACE", function()
    hl.dispatch(hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
end)

-- 🔊 MULTIMEDIA KEYS (Audio & Brightness controls)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true })

 🎵 MEDIA TRACK CONTROLS (Requires playerctl tool installed.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

