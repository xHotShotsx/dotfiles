local gamemode_active = false

function toggle_gamemode()
    if not gamemode_active then
        -- 🎮 ENTER GAMEMODE (Max performance)
        hl.config({
            animations = { enabled = false },
            decoration = {
                shadow = { enabled = false },
                blur = { enabled = false },
                active_opacity = 1.0,
                inactive_opacity = 1.0,
                fullscreen_opacity = 1.0,
                rounding = 0
            },
            general = {
                gaps_in = 0,
                gaps_out = 0,
                border_size = 1
            }
        })
        print("Gamemode ON")
        gamemode_active = true
    else
        -- ✨ EXIT GAMEMODE (Restore your premium rice)
        hl.config({
            animations = { enabled = true },
            decoration = {
                shadow = { enabled = true },
                blur = { enabled = true },
                active_opacity = 0.9,       -- Change these to your actual 
                inactive_opacity = 0.8,     -- preferred rice values later
                fullscreen_opacity = 1.0,
                rounding = 10
            },
            general = {
                gaps_in = 5,
                gaps_out = 10,
                border_size = 2
            }
        })
        print("Gamemode OFF")
        gamemode_active = false
    end
end
