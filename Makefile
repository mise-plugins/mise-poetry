SH_SRCFILES = $(shell git ls-files "bin/*")
SHFMT_BASE_FLAGS = -i 2 -ci --space-redirects

fmt:
	shfmt -w $(SHFMT_BASE_FLAGS) $(SH_SRCFILES)
.PHONY: fmt

format-check:
	shfmt -d $(SHFMT_BASE_FLAGS) $(SH_SRCFILES)
.PHONY: format-check

lint:
	shellcheck $(SH_SRCFILES)
.PHONY: lint
