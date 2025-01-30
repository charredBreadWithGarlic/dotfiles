pc: config local home

config:
  stow -d . -t ~/.config config

home:
  stow -d . -t ~/ home

local:
  stow -d . -t ~/.local local

server:
  stow -d . -d ~/ server

server-copy:
  cp ./server/.bashrc ~/.

