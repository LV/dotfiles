# Luis Victoria's Dotfiles

## Profiles

Dotfiles are applied as filesystem overlays in this order:

1. `profiles/shared`
2. `profiles/platforms/<platform>` (lowercase `uname -s`: `darwin`, `linux`)

Preview or apply:

```sh
./bin/dotfiles check
./bin/dotfiles link --dry-run
./bin/dotfiles link
```

NixOS hosts don't use profiles; home-manager picks files from this repo directly, and
`link` refuses to run on them.

Config content lives in `config/<program>/`. Everything under `profiles/` is a
relative symlink into `config/`, except `checks/`. Nothing in `config/` is
linked unless a profile points at it.

## Acknowledgements
- `git_diag` was made thanks to [this post](https://piechowski.io/post/git-commands-before-reading-code/)
- `copy`, `pasta`, and `emoji` was [taken from this](https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/)
