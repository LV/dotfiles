.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make check PROFILE=<host> - Check required commands and packages"
	@echo "  make plan PROFILE=<host>  - Preview links for a host"
	@echo "  make link PROFILE=<host>  - Apply links for a host"

.PHONY: require-profile
require-profile:
	@test -n "$(PROFILE)" || (echo "PROFILE is required (for example: PROFILE=t480)" >&2; exit 2)

.PHONY: check
check: require-profile
	@./bin/dotfiles-check "$(PROFILE)"

.PHONY: plan
plan: require-profile
	@./bin/dotfiles-link plan "$(PROFILE)"

.PHONY: link
link: require-profile
	@./bin/dotfiles-link link "$(PROFILE)"
