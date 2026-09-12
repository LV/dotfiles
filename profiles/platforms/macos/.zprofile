eval "$(/opt/homebrew/bin/brew shellenv)"

# A stray /etc/paths.d/homebrew entry makes macOS's path_helper splice
# /opt/homebrew/bin into PATH ahead of `brew shellenv` running, and
# path_helper won't re-prioritize a path it already saw. Force Homebrew
# back to the front explicitly so it wins over /usr/bin (system Python
# et al.) regardless of path_helper's ordering.
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Added by Toolbox App
export PATH="$PATH:/Users/luisvictoria/Library/Application Support/JetBrains/Toolbox/scripts"
export ZDOTDIR="$HOME/.config/zsh"
