-- ~/.config/hypr/conf/decoration.lua

hl.config({
    decoration = {
        rounding = 10,
        
        active_opacity = 0.95,
        inactive_opacity = 0.85,

        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            new_optimizations = true
        },

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        }
    }
})
