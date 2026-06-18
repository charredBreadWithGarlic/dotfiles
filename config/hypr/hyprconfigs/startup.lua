-------- Startup --------

-- Autostart necessary processes (notification daemon, status bar, etc.)
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")                                       -- notification daemon
    hl.exec_cmd("systemctl --user start plasma-polkit-agent") -- authentication agent
    hl.exec_cmd("udiskie")                                    -- automatic usb mounting

    -- screen sharing
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data

    -- wallpaper daemon
    hl.exec_cmd("wpaperd -d")
end)

-- Environment variables
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "adwaita-dark")

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})
