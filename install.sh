#!/usr/bin/env sh

git submodule init
git submodule update
~/.config/emacs/bin/doom install
~/.config/emacs/bin/doom sync
