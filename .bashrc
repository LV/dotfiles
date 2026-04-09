# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PROMPT_COMMAND='branch=$(git branch --show-current 2>/dev/null); PS1="\[$(tput setaf 28)\]${branch:+($branch) }\[$(tput setaf 226)\]\u\[$(tput setaf 220)\]@\[$(tput setaf 214)\]\h \[$(tput setaf 33)\]\w \[$(tput sgr0)\]$ "'
# Exports
export DOTFILES="$HOME/Dev/dotfiles"
export PATH="$HOME/.local/bin:$DOTFILES/bin:$PATH"

# Aliases
alias cat="bat --paging=never"
alias grep="grep --color=auto"
alias gg="lazygit"
alias ls='ls --color=auto'
alias t="tmux"
alias v="nvim"
alias vd='nvim "$HOME/v/daily/$(date +%Y-%m-%d).txt"'

# Exports
export PATH="$HOME/.local/bin:$PATH"

# Functions
mkcdir () {
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}
