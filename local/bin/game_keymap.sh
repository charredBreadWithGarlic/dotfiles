#!/bin/bash

notify-send "Setting XWayland Keymap to us"
setxkbmap us

# Run game/other launch options
"$@"

notify-send "Setting XWayland Keymap back to colemak"
setxkbmap us -variant colemak
