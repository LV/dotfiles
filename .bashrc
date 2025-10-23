# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PROMPT_COMMAND='branch=$(git branch --show-current 2>/dev/null); PS1="\[$(tput setaf 28)\]${branch:+($branch) }\[$(tput setaf 226)\]\u\[$(tput setaf 220)\]@\[$(tput setaf 214)\]\h \[$(tput setaf 33)\]\w \[$(tput sgr0)\]$ "'

# Aliases
alias grep="grep --color=auto"
alias gg="lazygit"
alias ls='ls --color=auto'
alias v="nvim"

# Functions
mkcdir () {
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}
