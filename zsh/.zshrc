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
alias cat="bat"

# [[ PATH ]]
export PATH=$PATH:$HOME/.dotfiles/bin


# [[ History ]] 
SAVEHIST=5000 #Saves 1000 recent lines
HISTFILE="$ZDOTDIR/.zsh_history"
HISTDUP=erase # Gets rid of any duplicates
setopt appendhistory
setopt sharehistory # share history across all sessions
setopt hist_ignore_space # any command with space infront of will not be saved
                         # useful for not storing sensitive stuff
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# [[ ZINIT Plugin Manager ]]
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# [[ Plugins]]
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::sudo

autoload -U compinit && compinit # what does this do?
zinit cdreplay -q # recommend by the documentation

# [[ Completion settings ]] 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no # I think this doesn't do anything on my end
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# [[ Keybinding ]]
bindkey -v #currently set to vimmode
# Because nvim mode get rids of some keybind, here to some to restore!
bindkey '^r' history-incremental-search-backward 
bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# The following should be place last
# [[ PromptSetup: Powerlevel10k ]]
## See .p10k.zsh for the actual configuration of the prompt
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh


# [[ FZF Shell Integration ]]
eval "$(fzf --zsh)"
