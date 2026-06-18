-------- Monitor Settings --------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- main monitor
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1.25 })

-- home
hl.monitor({ output = "DP-4", mode = "preferred", position = "auto-up", scale = 1.6 })

-- main monitor - With extern GPU
-- hl.monitor({ output = "eDP-2", mode = "preferred", position = "0x0", scale = 1.25 })
hl.monitor({ output = "eDP-2", mode = "preferred", position = "0x0", scale = 1.6 })

-- home - With extern GPU
hl.monitor({ output = "DP-5", mode = "preferred", position = "auto-up", scale = 1.6 })

-- rechnerhalle monitor
-- TODO: change to shortcut switch
-- hl.monitor({ output = "DP-4", mode = "preferred", position = "auto-up", scale = 1 })

-- old home monitor
hl.monitor({ output = "DP-3", mode = "preferred", position = "auto-left", scale = 1 })

-- default
-- hl.monitor({ output = "", mode = "preferred", position = "auto-up", scale = "auto" })

-- default mirror
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-2" })
