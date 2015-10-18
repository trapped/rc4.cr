.PHONY: test

CRYSTAL ?= crystal

all: test

test:
	$(CRYSTAL) spec spec/rc4_spec.cr
