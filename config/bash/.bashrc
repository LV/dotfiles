# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Below 256 colours (linux console, xterm, screen) these codes come out wrong,
# and an unknown TERM makes tput print errors, so the prompt goes uncoloured.
if [ "$(tput colors 2>/dev/null)" -ge 256 ] 2>/dev/null; then
    ps1_branch="\[$(tput setaf 28)\]"
    ps1_user="\[$(tput setaf 226)\]"
    ps1_at="\[$(tput setaf 220)\]"
    ps1_host="\[$(tput setaf 214)\]"
    ps1_dir="\[$(tput setaf 33)\]"
    ps1_reset="\[$(tput sgr0)\]"
fi
PROMPT_COMMAND='branch=$(git branch --show-current 2>/dev/null); PS1="${ps1_branch}${branch:+($branch) }${ps1_user}\u${ps1_at}@${ps1_host}\h ${ps1_dir}\w ${ps1_reset}$ "; case $TERM in linux|dumb) ;; *) [ -z "${INSIDE_EMACS:-}" ] && PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;; esac'

# Exports
export DOTFILES="$HOME/Dev/dotfiles"
export EDITOR="nvim"
[ -e /etc/NIXOS ] || export PATH="$DOTFILES/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Aliases
if command -v batcat &> /dev/null; then
    alias cat="batcat --paging=never"
elif command -v bat &> /dev/null; then
    alias cat="bat --paging=never"
fi
alias grep="grep --color=auto"
alias gg="lazygit"
alias ls='ls --color=auto'
alias t="tmux"
alias v="nvim"
alias vd='nvim "$HOME/Vault/Daily/$(date +%Y-%m-%d).md"'

# Functions
mkcdir () {
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}
