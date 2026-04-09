.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make help     - Show this help message"
	@echo "  make replace  - Replaces ~/.bashrc with this one (via symlink)"

DOTFILES_DIR := $(shell pwd)

.PHONY: replace
replace:
	@if [ -e ~/.bashrc ] && [ ! -L ~/.bashrc ]; then \
		cp ~/.bashrc ~/.bashrc.bak && echo "Backed up ~/.bashrc to ~/.bashrc.bak"; \
	fi
	@ln -sf $(DOTFILES_DIR)/.bashrc ~/.bashrc
	@echo "Linked ~/.bashrc -> $(DOTFILES_DIR)/.bashrc"
