-- ~/.config/hypr/conf/layout.lua (or general configuration drawer)

hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 12,
        border_size = 2,
        
        col = {
            active_border = {
                colors = { "rgba(ff007fee)", "rgba(00f0ffee)" },
                angle = 45
            },
            inactive_border = "rgba(595959aa)"
        },

        layout = "dwindle"
    },

    dwindle = {
        preserve_split = true
    },
    
    master = {
        new_status = "master"
    },
    
    scrolling = {
        fullscreen_on_one_column = true
    }
})
