-------- Keybinds --------
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

-- Divide keybinds into 4 layers
local mainMod0 = "SUPER"         -- everyday binds
local mainMod1 = "SUPER + SHIFT" -- additional layer for everyday binds
local extraMod = "SUPER + CTRL"  -- for additional functionality, eg Wallpapers
local superMod = "SUPER + ALT"   -- for powerful commands


-------- mainMod0 --------

-- applications
hl.bind(mainMod0 .. " + B", hl.dsp.exec_cmd("firefox"))              -- internet Browser
hl.bind(mainMod0 .. " + M", hl.dsp.exec_cmd("nautilus"))             -- file Manager
hl.bind(mainMod0 .. " + N", hl.dsp.exec_cmd("kitty"))                -- New terminal
hl.bind(mainMod0 .. " + P", hl.dsp.exec_cmd("keepassxc"))            -- Password manager
hl.bind(mainMod0 .. " + SPACE", hl.dsp.exec_cmd("wofi --show drun")) -- Program startup agent
hl.bind(mainMod0 .. " + D", hl.dsp.exec_cmd("steam"))                -- G on keyboard for games, steam, since wofi will not start

-- Window control
hl.bind(mainMod0 .. " + Q", hl.dsp.window.close()) -- close current application

-- Screenshot area
hl.bind(mainMod0 .. " + S", hl.dsp.exec_cmd("grimblast copysave area"))

-- switch workspaces with mainMod + [0-9], and move active window to a
-- workspace with mainMod + SHIFT + [0-9] (0 maps to workspace 10)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod0 .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod1 .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- switch window within workspace
hl.bind(mainMod0 .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod0 .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod0 .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod0 .. " + L", hl.dsp.focus({ direction = "right" }))

-- toggle fullscreen (with borders / maximized)
hl.bind(mainMod0 .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- toggle float
hl.bind(mainMod0 .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- move window with mouse lmb
hl.bind(mainMod0 .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })


-------- mainMod1 --------

-- toggle borderless fullscreen
hl.bind(mainMod1 .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- swap window
hl.bind(mainMod1 .. " + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod1 .. " + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod1 .. " + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod1 .. " + L", hl.dsp.window.swap({ direction = "right" }))

-- Screenshot active window
hl.bind(mainMod1 .. " + S", hl.dsp.exec_cmd("grimblast copysave active"))


-------- extraMod --------

-- resize active window by holding ctrl+super+x
hl.bind(extraMod .. " + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(extraMod .. " + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind(extraMod .. " + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(extraMod .. " + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })

-- wallpaper
hl.bind(extraMod .. " + N", hl.dsp.exec_cmd("wpaperctl next"))

-- cursor lock
hl.bind(extraMod .. " + C", hl.dsp.exec_cmd("cursorlock.sh 0"))


-------- superMod --------

-- general control
-- these keybinds are meant to make sense with the colemak keyboard
hl.bind(superMod .. " + I", hl.dsp.exec_cmd("hyprlock"))     -- "L" for "Lock"
hl.bind(superMod .. " + R", hl.dsp.exec_cmd("shutdown now")) -- "S" for "Shutdown"
hl.bind(superMod .. " + F", hl.dsp.exit())                   -- "E" for "Exit"
-- hl.bind(superMod .. " + H", hl.dsp.exec_cmd("hibernate"))


-------- noMod --------

-- control brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +10%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })

-- control audio volume, also when locked
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- Screenshot whole screen
hl.bind("Print", hl.dsp.exec_cmd("grimblast copysave output"))
