# my actualy zshrc

# Functions
# [[ Aliases ]]
alias ll="ls"
alias v="nvim"
alias cf="source fuzzy_cd"
alias ..="cd .."
alias tt="cd ~/throw-away-code"

# My own scirpt Bin Path
export PATH=$PATH:$HOME/.dotfiles/bin

export ZDOTDIR="$HOME/.config/zsh"

source "$ZDOTDIR/zsh-functions"
