# my actualy zshrc

# Functions
# [[ Aliases ]]
alias ll="ls"
alias v="nvim"
alias cf="source fuzzy_cd"
alias ..="cd .."
alias tt="cd ~/throw-away-code"
# alias ssh-login="source ssh-login"

# My own scirpt Bin Path
export PATH=$PATH:$HOME/.dotfiles/bin

export ZDOTDIR="$HOME/.config/zsh"

source "$ZDOTDIR/zsh-functions"

# History
SAVEHIST=1000 #Saves 1000 recent lines
HISTFILE="$ZDOTDIR/.zsh_history"

source ssh-login
