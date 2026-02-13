# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository managing configurations for editors (VSCode, Zed, Vim/Neovim), terminal (Ghostty), shell (Zsh/Oh My Zsh), tmux, and development environments (Docker, Rust, Go, Python).

## Quick Reference - Custom Keybindings

**Tmux** (prefix: `Insert` key, not `Ctrl+b`):
- Split: `|` horizontal, `_` vertical
- Mouse: `<prefix> + M` on, `<prefix> + m` off
- Rename: `<prefix> + r` window, `<prefix> + R` session
- Zoom: `<prefix> + +` in, `<prefix> + -` out

**Ghostty Terminal**:
- `Ctrl+Up/Down/Left/Right`: create splits in respective direction

**Zsh**:
- `zs`: reload `.zshrc`
- Commands with leading space are not saved to history

## Repository Structure & Deployment

### Directory Structure

```
.
├── shell/              # Shell configurations
│   ├── zshrc          # Zsh configuration
│   └── oh-my-zsh/     # Oh My Zsh related files
├── terminal/          # Terminal and multiplexer
│   ├── ghostty/       # Ghostty terminal config
│   └── tmux/          # Tmux configurations
│       ├── tmux.conf          # Standard config
│       └── tmux-ghostty.conf  # Ghostty-optimized
├── editors/           # Editor configurations
│   ├── vscode/        # VSCode settings, keybindings, snippets
│   ├── zed/           # Zed settings, keymap, tasks, snippets
│   └── vim/           # Vim/Neovim configurations
├── fonts/             # Font files
├── setup/             # Setup and installation guides
│   ├── docker-setup.md
│   ├── rust-setup.md
│   └── tmux-plugins.md
└── deploy.sh          # Deployment script
```

### File Mappings

| Repository Path | System Target Path |
|----------------|-------------------|
| `shell/zshrc` | `~/.zshrc` |
| `terminal/ghostty/config` | `~/.config/ghostty/config` |
| `terminal/tmux/tmux.conf` | `~/.tmux.conf` |
| `terminal/tmux/tmux-ghostty.conf` | `~/.tmux.conf` (alternative) |
| `editors/vscode/settings.json` | `~/.config/Code/User/settings.json` |
| `editors/vscode/keybindings.json` | `~/.config/Code/User/keybindings.json` |
| `editors/vscode/snippets/` | `~/.config/Code/User/snippets/` |
| `editors/zed/settings.json` | `~/.config/zed/settings.json` |
| `editors/zed/keymap.json` | `~/.config/zed/keymap.json` |
| `editors/zed/tasks.json` | `~/.config/zed/tasks.json` |
| `editors/zed/snippets/` | `~/.config/zed/snippets/` |
| `editors/vim/vimrc` | `~/.vimrc` |
| `editors/vim/init.vim` | `~/.config/nvim/init.vim` |

### Deployment

Deploy all configurations using the automated script:

```bash
./deploy.sh          # Interactive deployment with backups
./deploy.sh --force  # Force deployment without backups
```

The script will:
- Create necessary directories
- Back up existing configurations (unless --force)
- Create symlinks from repo to system locations
- Prompt for tmux configuration choice (standard vs Ghostty-optimized)

## Tmux Configuration

**Prefix Key:** `Insert` (not default `Ctrl+b`)

**Custom Keybindings:**
- `|`: split horizontal (preserves current path)
- `_`: split vertical (preserves current path)
- `<prefix> + M/m`: toggle mouse on/off
- `<prefix> + r/R`: rename window/session
- `<prefix> + +/-`: custom zoom in/out

**Plugin Manager (TPM):**
```bash
# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install/update plugins (from within tmux)
<prefix> + I
```

**Plugins:**
- `tmux-plugins/tpm` - Plugin manager
- `tmux-plugins/tmux-sidebar` - Tree-style file browser
- `tmux-plugins/tmux-resurrect` - Save/restore sessions
- `tmux-plugins/tmux-continuum` - Automatic session saving
- `tmux-plugins/tmux-prefix-highlight` - Highlight prefix key status

**Note:** Two configurations exist - standard `terminal/tmux/tmux.conf` and `terminal/tmux/tmux-ghostty.conf` optimized for Ghostty terminal.

## Zsh Configuration

**Theme:** `eastwood` (Oh My Zsh)

**Plugins:** git, z, zsh-autosuggestions, sudo, suse, tmux, extract, copypath, copyfile, copybuffer, dirhistory, zsh_reload

**History Behavior:**
- Duplicates automatically ignored
- Commands starting with space not saved
- Wrong/non-existent commands not saved
- Specific commands excluded (docker rm/rmi, git operations, file operations, etc.)

**Commands:**
```bash
# Reload configuration
source ~/.zshrc
# or
zs

# Install Oh My Zsh (if needed)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Docker Aliases:**
- `dim`, `drmi`, `dc`, `dca`, `drca`, `deit`, `lz`, `dcr`
- `dcup`, `dcdown`, `dcd`
- `lzd` (lazydocker)

**Python Aliases:**
- `deac` (deactivate virtualenv)

## Editors

### VSCode

**Extension Management:**
```bash
# From editors/vscode/ directory
make freeze-extensions    # Save current extensions to extensions-list.txt
make install-extensions   # Install from extensions-list.txt

# Or manually
code --list-extensions
```

**Custom Snippets:** Python, Rust (in `editors/vscode/snippets/`)

### Zed

**Custom Snippets:** Python, Go (in `editors/zed/snippets/`)

**Tasks:** Defined in `editors/zed/tasks.json`

### Vim/Neovim

**Shared Settings:**
- Syntax highlighting enabled
- Line numbers (absolute + relative)
- Tabs: 4 spaces, expanded
- Cursorline highlighting

**Config Locations:**
- Vim: `editors/vim/vimrc`
- Neovim: `editors/vim/init.vim`

## Ghostty Terminal

**Theme:** Catppuccin Frappe

**Split Keybindings:**
- `Ctrl+Up`: new split up
- `Ctrl+Down`: new split down
- `Ctrl+Left`: new split left
- `Ctrl+Right`: new split right

**Config Location:** `terminal/ghostty/config`

**Commands:**
```bash
ghostty +list-themes    # List available themes
ghostty +list-keybinds  # List keybindings
ghostty +list-fonts     # List available fonts
```

## Development Environments

### Python (virtualenvwrapper)
- Virtual environments: `~/development/venvs/`
- Projects: `~/development/projects/`
- Python: System default (`/usr/bin`) prioritized over Anaconda

### Go
- `GOPATH`: `~/development/workspace/go`
- `GOBIN`: `~/development/workspace/go/bin`

### Rust
```bash
# Install Rust toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

### Docker
- Storage location: `/home/docker` (symlinked from `/var/lib/docker`)
- Configured for XFS filesystem with overlay2 storage driver
- See [setup/docker-setup.md](setup/docker-setup.md) for installation instructions

## Git Conventions

**Commit Message Pattern:**
- `Update [component]`: configuration changes
- `New [component]`: new configurations
- `Fixed [component]`: corrections

**Configuration:**
- Git pager disabled globally (`export GIT_PAGER=cat` in `.zshrc`)
