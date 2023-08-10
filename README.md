# Dotfiles

_My dotfile configurations_

## Getting started

``` sh
git clone https://github.com/LV/dotfiles.git ~/.config
cd ~/.config/
./install.sh
```

If you have a `permission denied` error, just do:

``` sh
chmod u+x install.sh
```

NOTE: Make sure that you backup your `.zshrc` file; you will need to replace it with this configuration

``` sh
ln -s ~/.config/.zshrc ~/.zshrc
```

## Troubleshooting

### ❓ When launching Emacs, I do not have your config!
Emacs loads `init.el` in the following preference ([more info](https://www.gnu.org/software/emacs/manual/html_node/emacs/Find-Init.html)):

1. `~/.emacs.el`
2. `~/.emacs`
3. `~/.emacs.d/init`
4. `~/.config/emacs` (or `$XDG_CONFIG_HOME`)

Check to see if the first three locations exist, and remove them

### ❓ Upon launching Emacs, no window appears!
Sometimes, you need to install additional modules within Emacs and this leads to weird things such as no window appearing. Simply launch Emacs with the following:

``` sh
emacs --debug-init
```

NOTE: This problem was seen on my M1 machine (see [here](https://github.com/LV/dotfiles/commit/1dd1a79af6a27f9103d4c39bdbea04fde2535e0b#commitcomment-124109384))
