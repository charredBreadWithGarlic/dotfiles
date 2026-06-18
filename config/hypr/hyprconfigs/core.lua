-------- Hyprland Settings --------
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 4,
        layout   = "dwindle",
    },

    decoration = {
        rounding           = 4,
        active_opacity     = 1,
        inactive_opacity   = 1,
        fullscreen_opacity = 1,
        blur               = {
            enabled = false,
            size    = 4,
        },
    },

    dwindle = {
        force_split = 2,
    },

    misc = {
        -- disable, because then the background loads smoother
        disable_hyprland_logo = true,
    },

    cursor = {
        no_hardware_cursors = true,
    },
})
