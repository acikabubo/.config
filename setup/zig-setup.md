# Zig Development Setup

## Installation

### Option 1: Official Binary (Recommended)

Download the latest version from [ziglang.org/download](https://ziglang.org/download/):

```bash
# Download latest version (check website for current version)
cd ~/Downloads
wget https://ziglang.org/download/0.12.0/zig-linux-x86_64-0.12.0.tar.xz

# Extract
tar -xf zig-linux-x86_64-0.12.0.tar.xz

# Move to /usr/local
sudo mv zig-linux-x86_64-0.12.0 /usr/local/zig

# Add to PATH (already in shell/zshrc or add manually)
export PATH=$PATH:/usr/local/zig

# Clean up
rm zig-linux-x86_64-0.12.0.tar.xz
```

### Option 2: Package Manager

```bash
# openSUSE/SUSE (may have older version)
sudo zypper install zig
```

### Option 3: Build from Source

```bash
# Clone repository
git clone https://github.com/ziglang/zig
cd zig

# Build (requires LLVM, Clang, and LLD)
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make install
```

## Environment Configuration

Add Zig to your PATH in `shell/zshrc`:

```bash
# Zig
export PATH=$PATH:/usr/local/zig
```

Then reload:

```bash
source ~/.zshrc
# or
zs
```

## Verification

```bash
# Check Zig version
zig version

# Check available commands
zig help

# Run Zig REPL
zig
```

## Quick Start

### Hello World

Create `hello.zig`:

```zig
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"World"});
}
```

Build and run:

```bash
# Build
zig build-exe hello.zig

# Run
./hello

# Or build and run in one step
zig run hello.zig
```

## Common Commands

```bash
# Create a new project
zig init-exe    # Executable project
zig init-lib    # Library project

# Build project
zig build

# Build with optimization
zig build -Doptimize=ReleaseFast
zig build -Doptimize=ReleaseSmall
zig build -Doptimize=ReleaseSafe

# Run project
zig build run

# Run tests
zig build test
zig test src/main.zig

# Format code
zig fmt src/

# Cross-compile
zig build -Dtarget=x86_64-windows
zig build -Dtarget=aarch64-macos

# List available targets
zig targets

# Use as C/C++ compiler
zig cc file.c
zig c++ file.cpp
```

## Project Structure

A typical Zig project created with `zig init-exe`:

```
my-project/
├── build.zig       # Build configuration
├── build.zig.zon   # Package dependencies
└── src/
    ├── main.zig    # Entry point
    └── root.zig    # Library root (for init-lib)
```

## Useful Tools

### Zig Language Server (ZLS)

```bash
# Clone and build ZLS
git clone https://github.com/zigtools/zls
cd zls
zig build -Doptimize=ReleaseSafe

# Install (copy to PATH location)
sudo cp zig-out/bin/zls /usr/local/bin/
```

### Package Manager (built-in)

Zig 0.11+ has built-in package management via `build.zig.zon`:

```zig
// build.zig.zon
.{
    .name = "my-project",
    .version = "0.1.0",
    .dependencies = .{
        .@"package-name" = .{
            .url = "https://github.com/user/package/archive/hash.tar.gz",
            .hash = "1220abc...",
        },
    },
}
```

## Resources

- Official Documentation: https://ziglang.org/documentation/master/
- Learn Zig: https://ziglearn.org/
- Zig Standard Library: https://ziglang.org/documentation/master/std/
- Community: https://github.com/ziglang/zig/wiki/Community
