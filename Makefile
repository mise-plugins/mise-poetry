SH_SRCFILES = $(shell git ls-files "bin/*")
TEST_SRCFILES = $(shell git ls-files "tests/**/*.bats")
SHFMT_BASE_FLAGS = -i 2 -ci --space-redirects

fmt:
	shfmt -w $(SHFMT_BASE_FLAGS) $(SH_SRCFILES)
	shfmt -w $(SHFMT_BASE_FLAGS) -ln bats $(TEST_SRCFILES)
.PHONY: fmt

format-check:
	shfmt -d $(SHFMT_BASE_FLAGS) $(SH_SRCFILES)
	shfmt -d $(SHFMT_BASE_FLAGS) -ln bats $(TEST_SRCFILES)
.PHONY: format-check

lint:
	shellcheck $(SH_SRCFILES)
.PHONY: lint

test:
	tests/run_tests.sh
.PHONY: test
