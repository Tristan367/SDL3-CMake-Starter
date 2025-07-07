## 🛠 Getting Started

### 1. **Install a C++ compiler**

This project supports **Linux**, **Windows**, and **macOS**.

- **Linux**: Install `g++` or `clang` using your system’s package manager.
  - Arch: `sudo pacman -S gcc`
  - Debian/Ubuntu: `sudo apt install build-essential`
- **Windows**: Use [MSVC](https://visualstudio.microsoft.com/visual-cpp-build-tools/), or install [MinGW-w64](http://mingw-w64.org/) for GCC.
- **macOS**: Comes with Clang via Xcode. Or use [Homebrew](https://brew.sh/) and run `brew install gcc` if you prefer GNU g++.

### 2. **Install a debugger (optional, for debug mode)**

If you plan to run the app in **debug mode** from VS Code, you’ll need a debugger installed:

- **Linux**: Install GDB  
  - Arch: `sudo pacman -S gdb`  
  - Debian/Ubuntu: `sudo apt install gdb`
- **Windows**: No action needed — the MSVC debugger is included with Visual Studio.
- **macOS**: LLDB is included with Xcode. You can also install GDB via Homebrew: `brew install gdb`  
  > ⚠️ GDB on macOS requires code signing. LLDB is recommended.

> 📝 If you're only running the app in **release mode**, a debugger is not required.

### 3. **Install CMake**

Download it from the official site: [cmake.org](https://cmake.org/download/)

Or install it via your package manager:

- **Linux**: `sudo pacman -S cmake`, `sudo apt install cmake`, etc.
- **Windows**: Use the official installer, or `choco install cmake` if you use Chocolatey
- **macOS**: `brew install cmake`

Make sure `cmake` is available in your system’s `PATH`.

### 4. **Set up your development environment**

- Download and install [Visual Studio Code](https://code.visualstudio.com/)
- Install the following extensions:
  - **C/C++** (`ms-vscode.cpptools`)
  - **CMake Tools** (`ms-vscode.cmake-tools`)

### 5. **Build and run the project**

- Open the project folder in VS Code
- Open the **Run and Debug** sidebar
- Select a launch configuration for your platform and build type (e.g. `Debug: Linux (gdb)`)
- Press `F5` or click **Run** to build and launch the app

---

### ✅ Notes

- Uses **CMake** to handle cross-platform builds and automate configuration
- VS Code tasks and launch configs are preconfigured — no manual setup required
- Works out of the box on **Linux**, **Windows**, and **macOS**
- Automatically adapts to Wayland environments on Linux when needed