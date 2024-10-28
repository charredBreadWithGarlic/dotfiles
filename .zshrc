# Zshrc, mostly copied from [Dreams of Autonomy](https://www.youtube.com/watch?v=ud7YxC33Z3w)
# - zinit: plugin manager
# - powerlevle10k prompt
# - fzf for fuzzy finding
# - zoxide for better cd

#
# --- Enable Powerlevel10k instant prompt ---
# Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# --- Generall Exports ---
#
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

#
# --- Zinit ---
#
source ~/.config/zsh/zinit.zsh

#
# --- Personal Settings ---
#

# Options
# setopt interactivecomments
setopt hist_ignore_space # commands with leading space will not be saved

# Aliases
source ~/.config/zsh/aliases.zsh

# Shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# vim keybinds
bindkey -v
bindkey '^E' autosuggest-accept # while '^M' would be more convinient, it seems that ENTER will then not work
bindkey '^J' history-search-forward
bindkey '^K' history-search-backward

export KEYTIMEOUT=1
