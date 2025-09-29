
# Build outputs under build/ mirroring the source tree
BUILD_DIR := build
SOURCES   := $(shell find . -type f -name '*.S')
TARGETS   := $(patsubst ./%.S,$(BUILD_DIR)/%,$(SOURCES))

.PHONY: all
all: $(TARGETS)

# Rule: build build/<path>/<name> from ./<path>/<name>.S
$(BUILD_DIR)/%: ./%.S
	@mkdir -p $(dir $@)
	arm-linux-gnueabihf-gcc -g -nostdlib -nostartfiles -static -o $@ $<

clean:
	rm -rf $(BUILD_DIR)
