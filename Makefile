##
# Dotfile Config
#
# @file
# @version 0.2

# Install Doom Emacs
.PHONY: doom
doom:
	git submodule init
	git submodule update
	~/.config/emacs/bin/doom install
	~/.config/emacs/bin/doom sync
# end
