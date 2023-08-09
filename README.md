# Dotfiles

_My dotfile configurations_

## Important!

Once you clone this repository, it is critical that you initialize the git submodules:

``` sh
git submodule init
git submodule update
~/.config/emacs/bin/doom install
~/.config/emacs/bin/doom sync
```

## Troubleshooting

#### Q: When launching Emacs, I do not have your config!
Emacs loads `init.el` in the following preference ([more info](https://www.gnu.org/software/emacs/manual/html_node/emacs/Find-Init.html))

1. `~/.emacs.el`
2. `~/.emacs`
3. `~/.emacs.d/init`
4. `~/.config/emacs` (or `$XDG_CONFIG_HOME`)

Check to see if the first three locations exist, and remove them
