.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make check PROFILE=<host> - Check required commands and packages"
	@echo "  make install PROFILE=<host> - Install profile requirements"
	@echo "  make link PROFILE=<host>  - Apply links for a host"
	@echo "    Add DRY_RUN=1 to install or link to preview changes"

.PHONY: require-profile
require-profile:
	@test -n "$(PROFILE)" || (echo "PROFILE is required (for example: PROFILE=t480)" >&2; exit 2)

.PHONY: check
check: require-profile
	@./bin/dotfiles-check "$(PROFILE)"

.PHONY: install
install: require-profile
	@./bin/dotfiles-install $(if $(filter 1 true yes,$(DRY_RUN)),plan,install) "$(PROFILE)"

.PHONY: link
link: require-profile
	@./bin/dotfiles-link $(if $(filter 1 true yes,$(DRY_RUN)),plan,link) "$(PROFILE)"
