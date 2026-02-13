# Rust Toolchain Setup

## Installation

Install Rust using rustup (the official Rust toolchain installer):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Post-Installation

Load Rust environment in current shell:

```bash
source $HOME/.cargo/env
```

The installer will automatically add Rust to your PATH in `~/.zshrc` for future sessions.

## Verification

```bash
# Check Rust version
rustc --version

# Check Cargo version
cargo --version

# Check rustup version
rustup --version
```

## Common Commands

```bash
# Update Rust toolchain
rustup update

# Add a toolchain component
rustup component add rust-analyzer

# Show installed toolchains
rustup show

# Set default toolchain
rustup default stable
```
