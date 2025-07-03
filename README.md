## 🛠 Getting Started

### 1. **Install a C++ compiler**

This project supports **macOS**, **Linux**, and **Windows**.

- **macOS**: Comes with Clang via Xcode. Or use [Homebrew](https://brew.sh/) and run `brew install gcc` if you prefer GNU g++.
- **Linux**: Any modern C++ compiler will work — install `g++` or `clang` using your system’s package manager.
- **Windows**: Use [MSVC](https://visualstudio.microsoft.com/visual-cpp-build-tools/), or install [MinGW-w64](http://mingw-w64.org/) for GCC.

### 2. **Install CMake**

Download it from the official site: [cmake.org](https://cmake.org/download/)

- Or install it via package manager:
  - macOS: `brew install cmake`
  - Linux: `sudo pacman -S cmake`, `sudo dnf install cmake`, etc.
  - Windows: Use the official installer, or `choco install cmake` if you use Chocolatey

Make sure `cmake` is available in your system’s `PATH`.

### 3. **Set up your development environment**

- Download and install [Visual Studio Code](https://code.visualstudio.com/)
- Install the following extensions:
  - **C/C++** (`ms-vscode.cpptools`)
  - **CMake Tools** (`ms-vscode.cmake-tools`)

### 4. **Build and run the project**

- Open the project folder in VS Code
- Open the **Run and Debug** sidebar
- Select the appropriate launch task from the dropdown
- Press `F5` or click **Run** to build and launch the app

---

### ✅ Notes

- Uses **CMake** to handle cross-platform builds and automate configuration
- VS Code tasks and launch configs are preconfigured — no manual setup required
- Works out of the box on **macOS**, **Linux**, and **Windows**
