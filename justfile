pc: config local home etc

config:
  stow -d . -t ~/.config config

home:
  stow -d . -t ~/ home

local:
  stow -d . -t ~/.local local

etc:
  sudo stow -d . -t /etc etc

server:
  stow -d . -d ~/ server

server-copy:
  cp ./server/.bashrc ~/.

