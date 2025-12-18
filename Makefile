# Claim Forge - Makefile
# IP registration and timestamping system
# SPDX-License-Identifier: AGPL-3.0-or-later

# Variables
PROJECT = claim-forge
GPR_FILE = claim-forge.gpr
PREFIX ?= /usr/local

# Build modes
BUILD_MODE ?= release

# Directories
SRC_DIR = src
BIN_DIR = bin
OBJ_DIR = obj

# Phony targets
.PHONY: all build release debug clean distclean install uninstall check format test help

# Default target
all: build

# Build in release mode (optimized)
build: release

# Release build
release:
	@echo "Building $(PROJECT) (release mode)..."
	gprbuild -p -j0 -XBUILD_MODE=release -P $(GPR_FILE)
	@echo "Build complete: $(BIN_DIR)/$(PROJECT)"

# Debug build
debug:
	@echo "Building $(PROJECT) (debug mode)..."
	gprbuild -p -j0 -XBUILD_MODE=debug -P $(GPR_FILE)
	@echo "Debug build complete: $(BIN_DIR)/$(PROJECT)"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	-gprclean -P $(GPR_FILE) 2>/dev/null || true
	rm -rf $(OBJ_DIR)/
	@echo "Clean complete"

# Clean everything including binaries
distclean: clean
	@echo "Removing binaries..."
	rm -rf $(BIN_DIR)/$(PROJECT)
	@echo "Distribution clean complete"

# Install to PREFIX
install: release
	@echo "Installing to $(PREFIX)..."
	install -d $(PREFIX)/bin
	install -m 755 $(BIN_DIR)/$(PROJECT) $(PREFIX)/bin/
	@echo "Installed: $(PREFIX)/bin/$(PROJECT)"

# Uninstall from PREFIX
uninstall:
	@echo "Uninstalling from $(PREFIX)..."
	rm -f $(PREFIX)/bin/$(PROJECT)
	@echo "Uninstalled"

# Check Ada syntax
check:
	@echo "Checking Ada syntax..."
	-gnatcheck -P $(GPR_FILE)

# Format Ada code
format:
	@echo "Formatting Ada code..."
	find $(SRC_DIR) -name "*.adb" -o -name "*.ads" | xargs -I {} sh -c 'gnatpp -rnb {} || true'

# Run tests
test: build
	@echo "Running integration tests..."
	./docs/examples/test-workflow.sh

# Verify compilation only
verify:
	@echo "Verifying compilation..."
	gprbuild -p -j0 -XBUILD_MODE=release -P $(GPR_FILE) -c

# Show help
help:
	@echo "Claim Forge - Build System"
	@echo ""
	@echo "Targets:"
	@echo "  all        - Build in release mode (default)"
	@echo "  build      - Build in release mode"
	@echo "  release    - Build optimized binary"
	@echo "  debug      - Build with debug symbols"
	@echo "  clean      - Remove build artifacts"
	@echo "  distclean  - Remove all generated files"
	@echo "  install    - Install to PREFIX (default: /usr/local)"
	@echo "  uninstall  - Remove from PREFIX"
	@echo "  check      - Check Ada syntax"
	@echo "  format     - Format Ada source code"
	@echo "  test       - Run integration tests"
	@echo "  verify     - Verify compilation without linking"
	@echo "  help       - Show this help"
	@echo ""
	@echo "Variables:"
	@echo "  PREFIX     - Installation prefix (default: /usr/local)"
	@echo "  BUILD_MODE - Build mode: release or debug (default: release)"
	@echo ""
	@echo "Examples:"
	@echo "  make                    # Build in release mode"
	@echo "  make debug              # Build with debug symbols"
	@echo "  make install PREFIX=/opt/claim-forge"
