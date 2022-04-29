# -*- mode: makefile -*-

#
#--------------------------------------------------------------------------
##@ General
#--------------------------------------------------------------------------
#
.PHONY: help
help: ## Print this help with list of available commands/targets and their purpose
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
#
#--------------------------------------------------------------------------
##@ Development
#--------------------------------------------------------------------------
#

.PHONY: install
install: generate ## Install dotfiles
	@bash "$(PWD)/dotfiles.sh"

.PHONY: shellcheck
shellcheck: ## run shellcheck tests
	@find "$(PWD)" -type f -iname "*.sh" | xargs shellcheck
