-- ~/.config/hypr/lua/config/input.lua

hl.config({
    input = {
        -- 🌐 THE GLOBAL POLYGLOT MATRIX
        -- gb = UK English  | ara = Arabic | ru = Russian 
        -- gr = Greek       | il  = Hebrew | in = Hindi | pk = Urdu
        kb_layout = "gb,ara,ru,gr,il,in,pk", 
        
        -- 🔀 THE CYCLE SHORTCUT
        -- This lets you cycle through all 7 layouts sequentially.
        -- Swap to "grp:alt_shift_toggle" if you prefer that over Super + Space.
        kb_options = "grp:alt_shift_toggle",
        
        kb_variant = "",
        kb_model = "",
        kb_rules = "",

        -- 🖱️ HARDCORE GAMING MOUSE PERFORMANCE
        follow_mouse = 1,
        sensitivity = 0,            -- Raw input via DPI engine
        accel_profile = "flat",     -- 🎯 NO MOUSE ACCELERATION (Mandatory for shooters)
        force_no_accel = true,
        
        touchpad = {
            natural_scroll = false
        }
    }
})
