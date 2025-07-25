PROJECT_NAME = app

# Detect OS and set executable name and debugger
ifeq ($(OS),Windows_NT)
    EXEC = $(PROJECT_NAME).exe
    DEBUGGER = cdb
    RUN = $(EXEC)
else
    EXEC = $(PROJECT_NAME)
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Darwin)
        DEBUGGER = lldb
    else
        DEBUGGER = gdb
    endif
    RUN = ./$(EXEC)
endif

# Default target
all: release

# Debug build and run
debug:
	@echo "==> Configuring Debug build..."
	cmake -B build/debug -DCMAKE_BUILD_TYPE=Debug
	@echo "==> Building executable '$(EXEC)' in Debug..."
	cmake --build build/debug --target $(PROJECT_NAME) || { echo "Build failed."; exit 1; }
	@echo "==> Launching with $(DEBUGGER)..."
	cd build/debug && $(DEBUGGER) -ex "run" $(EXEC)

# Release build and run
release:
	@echo "==> Configuring Release build..."
	cmake -B build/release -DCMAKE_BUILD_TYPE=Release
	@echo "==> Building executable '$(EXEC)' in Release..."
	cmake --build build/release --target $(PROJECT_NAME) || { echo "Build failed."; exit 1; }
	@echo "==> Running Release build..."
	cd build/release/$(PROJECT_NAME) && $(RUN)
