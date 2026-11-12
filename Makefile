HOST := $(shell uname -n | cut -d. -f1)

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make check   - Check required commands and packages"
	@echo "  make install - Install profile requirements"
	@echo "  make link    - Apply links for this host"
	@echo "    Add DRY_RUN=1 to install or link to preview changes"

.PHONY: require-host
require-host:
	@test -d "profiles/hosts/$(HOST)" || (echo "No matching host profile found for hostname: $(HOST)" >&2; exit 1)

.PHONY: check
check: require-host
	@./bin/dotfiles-check "$(HOST)"

.PHONY: install
install: require-host
	@./bin/dotfiles-install $(if $(filter 1 true yes,$(DRY_RUN)),plan,install) "$(HOST)"

.PHONY: link
link: require-host
	@./bin/dotfiles-link $(if $(filter 1 true yes,$(DRY_RUN)),plan,link) "$(HOST)"
