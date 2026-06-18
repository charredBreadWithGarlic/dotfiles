-------- Input Settings --------

hl.config({
    input = {
        kb_layout     = "us, us",
        kb_variant    = "colemak, ",
        -- press both shift for layout toggle
        kb_options    = "grp:shifts_toggle",

        accel_profile = "linear",

        -- Cursor focus will be detached from keyboard focus. Clicking on a
        -- window will move keyboard focus to that window.
        follow_mouse  = 2,

        -- Mouse sensitivity
        sensitivity   = 0.6,

        touchpad      = {
            natural_scroll = true,
            scroll_factor  = 1,
            tap_to_click   = true,
        },
    },
    gestures = {
        workspace_swipe_forever = true
    }
})

-------- Gesture Definitions --------

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})
