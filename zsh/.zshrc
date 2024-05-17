# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# [[ Aliases ]]
alias v="nvim"
alias cf="source fuzzy_cd"
alias ..="cd .."
alias tt="cd ~/throw-away-code"

# [[ PATH ]]
export PATH=$PATH:$HOME/.dotfiles/bin


# [[ History ]] 
SAVEHIST=5000 #Saves 1000 recent lines
HISTFILE="$ZDOTDIR/.zsh_history"

# [[ ZINIT Plugin Manager ]]
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# [[ PromptSetup: Powerlevel10k ]]
zinit ice depth=1; zinit light romkatv/powerlevel10k


[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
