# my dotfiles

Hi.

This is my dotfiles repo. It features:

- hyprland
  - notification daemon: mako
  - lockscreen: hyprlock
  - terminal: kitty
  - background: wpaperd
  - bar-thingy: waybar
  - other: cursorlock (org. hyprlock, for locking cursor)
- nvim
- zsh

These dotfiles are managed with `stow`, wrapped by `just`. To get them where they need to go, take a look at the `justfile`.

A lot in this setup is only working for specific tasks or looks like it is about to break.
This setup is not nearly as secure as I would like it to be, so please don't use this information to break it :D

## Thanks

Special thanks to these people:

- [Treeniks; Hyprland initial setup, waybar config, ...](https://github.com/Treeniks/dotfiles)
- [Mohammed Goder; cursor locking](https://git.mgoder.com/mg/hyprlock)
- [Josean Martinez; nvim setup](https://www.josean.com/posts/how-to-setup-neovim-2024)
- [Dreams of Autonomy; zsh and stow](https://www.youtube.com/watch?v=ud7YxC33Z3w)
