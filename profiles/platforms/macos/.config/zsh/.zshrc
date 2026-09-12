setopt PROMPT_SUBST
PROMPT='%F{28}$(git branch --show-current 2>/dev/null | sed "s/.*/(&) /")%f%F{226}%n%f%F{220}@%f%F{214}%m%f %F{33}%~%f $ '

# ALIASES
alias cat="bat --paging=never"
alias gg="lazygit"
alias grep="grep --color=auto"
alias ls="ls -G"
alias t="tmux"
alias v="nvim"
alias vd='nvim "$HOME/v/daily/$(date +%Y-%m-%d).txt"'
alias vdn='nvim "$HOME/v/daily/$(date -v+1d +%Y-%m-%d).txt"'
alias vdp='nvim "$HOME/v/daily/$(date -v-1d +%Y-%m-%d).txt"'

## FUNCTIONS
mkcdir () {
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

autoload -U colors && colors
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export DOTFILES="$HOME/Dev/dotfiles/"
export EDITOR="nvim"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:bd=33;1:cd=33;1:su=37;41:sg=30;43:tw=30;42:ow=34;42:"
export PATH="$DOTFILES/bin:/opt/homebrew/opt/llvm/bin:$HOME/.local/bin:$PATH"
export TMPDIR="$HOME/tmp"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
eval $(opam env) # Otherwise path can't be found
[[ ! -r '/Users/luisvictoria/.opam/opam-init/init.zsh' ]] || source '/Users/luisvictoria/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
