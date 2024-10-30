# zsh aliases

alias ls='ls --color'

alias clc='wl-copy'
alias clp='wl-paste'
alias nv='nvim'
alias la='ln -la'
alias sgrep='grep -n -R -C 2 --color'

alias dn='display_note'

# cargo/rust
alias cr='cargo run'
alias cc='cargo clippy'
alias ca='cargo add'
alias rb='rustup doc --book'

# git
alias gd='git diff'
alias ga='git add'
alias gp='git push'
alias gr='git restore'
alias gaa='git add --all'
alias gcm='git commit --message'
alias gpl='git pull'
alias gst='git status'
alias glp='git log -p -1' # show exact content of last commit
alias grs='git restore --staged'
alias glf='git log --follow' # display what happend to a file
alias grc='git rm --cached' # remove file from git
alias gdc='git diff --cached' # diff on staged files
alias gcam='git commit --all --message'
alias glol='git log --graph --pretty'
alias gcif='git diff-tree --no=commit-id --name-only -r' # display all files in a commit
