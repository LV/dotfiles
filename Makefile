.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make help  - Show this help message"
	@echo "  make link  - Symlinks .bashrc and each config/* folder into place"
	@echo "               (any real file/dir displaced is backed up under"
	@echo "               ~/.dotfiles-backup/<timestamp>/)"

DOTFILES_DIR := $(shell pwd)
TIMESTAMP := $(shell date +%Y%m%d-%H%M%S)
BACKUP_DIR := $(HOME)/.dotfiles-backup/$(TIMESTAMP)

CONFIG_DIRS := $(patsubst %/,%,$(wildcard $(DOTFILES_DIR)/config/*/))
LINK_PAIRS := "$(DOTFILES_DIR)/.bashrc:$(HOME)/.bashrc" \
	$(foreach d,$(CONFIG_DIRS),"$(d):$(HOME)/.config/$(notdir $(d))")

.PHONY: link
link:
	@mkdir -p $(HOME)/.config
	@for pair in $(LINK_PAIRS); do \
		src=$${pair%%:*}; \
		target=$${pair##*:}; \
		if [ -e "$$target" ] && [ ! -L "$$target" ]; then \
			mkdir -p "$(BACKUP_DIR)"; \
			mv "$$target" "$(BACKUP_DIR)/$$(basename $$target)"; \
			echo "Backed up $$target -> $(BACKUP_DIR)/$$(basename $$target)"; \
		fi; \
		ln -sfn "$$src" "$$target"; \
		echo "Linked $$target -> $$src"; \
	done
