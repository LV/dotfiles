# PATH exports
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export PATH=$PATH:/usr/lib/gcc:~/.config/emacs/bin
export PYTHONPATH=$PYTHONPATH:/opt/bb/bin/
export PATH=$PATH:/opt/bb/bin #BB
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"


# Settings
export LANG=en_US.UTF-8
export TERM_PROGRAM=Alacritty

# Default Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Tmux always launch
if [[ "$TERM_PROGRAM" == "Alacritty" ]]; then
    if [ -z "$TMUX" ]; then
        tmux attach || tmux new
    fi
fi

## FUNCTIONS
mkcdir () {
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

# ALIASES
alias fd=fdfind
alias v="nvim"
alias lg="lazygit"
