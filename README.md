# Luis Victoria's Dotfiles

## Profiles

Dotfiles are applied as filesystem overlays in this order:

1. `profiles/shared`
2. `profiles/platforms/<platform>`
3. `profiles/hosts/<hostname>`

Preview or apply this host's profile:

```sh
make check
make install DRY_RUN=1
make install
make link DRY_RUN=1
make link
```

Nothing is linked merely because it exists under `config/`.

## Acknowledgements
- `git_diag` was made thanks to [this post](https://piechowski.io/post/git-commands-before-reading-code/)
- `copy`, `pasta`, and `emoji` was [taken from this](https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/)

## `.bashrc` required software
- [bat](https://github.com/sharkdp/bat)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [neovim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux)

### Linux Fedora XFCE Spin
- [wmctrl](https://linux.die.net/man/1/wmctrl)
