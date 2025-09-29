

%: %.S
	arm-linux-gnueabihf-gcc -nostdlib -nostartfiles -static -o $@ $<
.PHONY: clean

clean:
	find . -type f -name '*.S' -exec sh -c 'for f; do b=$${f%.S}; [ -e "$$b" ] && rm -f "$$b"; done' _ {} +

clean-verbose:
	find . -type f -name '*.S' -exec sh -c 'set -x; for f; do b=$${f%.S}; [ -e "$$b" ] && rm -f "$$b"; done' _ {} +
