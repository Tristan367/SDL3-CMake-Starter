## 🛠 Getting Started

### 1. **Install a C++ Compiler**

- **Linux**: Use `g++` or `clang` via your package manager:
  - Arch: `sudo pacman -S gcc`
  - Debian/Ubuntu: `sudo apt install build-essential`
- **Windows**:
  - Install [MSVC](https://visualstudio.microsoft.com/visual-cpp-build-tools/), or use [MinGW-w64](http://mingw-w64.org/)
- **macOS**:
  - Comes with Clang via Xcode
  - Or install via Homebrew: `brew install gcc`

---

### 2. **Install CMake**

Download from [cmake.org](https://cmake.org/download/) or use your package manager:

- Linux: `sudo pacman -S cmake` or `sudo apt install cmake`
- Windows: Use the official installer or `choco install cmake`
- macOS: `brew install cmake`

Ensure `cmake` is available in your terminal `PATH`.

---

### 3. **Build and Run**

This project uses a cross-platform **Makefile** for building and debugging.

#### 🔧 Release (default)

```bash
make
```

#### 🐛 Debug

```bash
make debug
```

---

### ✅ Notes

- The project is built into `build/release/` or `build/debug/` depending on mode
- Debug mode uses:
  - `gdb` on Linux  
  - `lldb` on macOS  
  - `cdb` or `windbg` on Windows (configurable via the Makefile)
- Assets are automatically copied into the build directory after each build
- SDL3, GLM, and stb are pulled via CMake — no need to install manually
- To rename the project, update `project(app LANGUAGES CXX)` in `CMakeLists.txt` and `PROJECT_NAME = app` in the Makefile
- The folder build/release/<project-name>/ contains the shippable build — ready for distribution or packaging

---

## 📝 TODO

- [ ] Implement cross-platform application icons for Windows, macOS, and Linux