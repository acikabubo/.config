# Dotfiles Repository

Personal configuration files for development environment.

## 📁 Repository Structure

```
.
├── shell/              # Shell configurations
│   ├── zshrc          # Zsh configuration → ~/.zshrc
│   └── oh-my-zsh/     # Oh My Zsh related files
│
├── terminal/          # Terminal and multiplexer
│   ├── ghostty/       # Ghostty terminal
│   │   └── config     # → ~/.config/ghostty/config
│   └── tmux/          # Tmux configurations
│       ├── tmux.conf          # Standard → ~/.tmux.conf
│       └── tmux-ghostty.conf  # Ghostty-optimized (alternative)
│
├── editors/           # Editor configurations
│   ├── vscode/        # VSCode → ~/.config/Code/User/
│   │   ├── settings.json
│   │   ├── keybindings.json
│   │   ├── snippets/
│   │   ├── extensions-list.txt
│   │   └── Makefile
│   ├── zed/           # Zed → ~/.config/zed/
│   │   ├── settings.json
│   │   ├── keymap.json
│   │   ├── tasks.json
│   │   └── snippets/
│   └── vim/           # Vim/Neovim
│       ├── vimrc      # → ~/.vimrc
│       └── init.vim   # → ~/.config/nvim/init.vim
│
├── fonts/             # Font files
│   ├── consolas-fonts-ttf.tar.gz
│   ├── FiraCode.tar.gz
│   └── README.md
│
├── setup/             # Setup and installation guides
│   ├── docker-setup.md
│   ├── rust-setup.md
│   └── tmux-plugins.md
│
├── deploy.sh          # Automated deployment script
├── CLAUDE.md          # AI assistant instructions
└── README.md          # This file
```

## 🚀 Quick Start

### Deploy All Configurations

```bash
# Interactive deployment (creates backups)
./deploy.sh

# Force deployment (no backups)
./deploy.sh --force
```

The deployment script will:
- Create necessary directories
- Backup existing configurations
- Create symlinks from repository to system locations
- Prompt for tmux configuration choice

### Manual Deployment

See [CLAUDE.md](CLAUDE.md) for detailed file mappings and manual deployment instructions.

## 🔧 Components

### Shell (Zsh)
- **Theme**: eastwood (Oh My Zsh)
- **Custom alias**: `zs` to reload configuration
- **History**: Smart filtering, space-prefixed commands ignored

### Terminal (Ghostty)
- **Theme**: Catppuccin Frappe
- **Splits**: `Ctrl+Up/Down/Left/Right`

### Multiplexer (Tmux)
- **Prefix**: `Insert` key (not `Ctrl+b`)
- **Splits**: `|` horizontal, `_` vertical
- **Mouse**: `<prefix> + M/m` toggle
- **Plugins**: TPM, sidebar, resurrect, continuum, prefix-highlight

### Editors
- **VSCode**: Settings, keybindings, snippets (Python, Rust)
- **Zed**: Settings, keymap, tasks, snippets (Python, Go)
- **Vim/Neovim**: Shared minimal configuration

## 📚 Additional Resources

- [CLAUDE.md](CLAUDE.md) - Comprehensive guide for working with this repository
- [setup/](setup/) - Installation guides for Docker, Rust, and tmux plugins
- [fonts/](fonts/) - Font installation files

## 🛠️ Common Tasks

### VSCode Extensions
```bash
cd editors/vscode
make freeze-extensions    # Save current extensions
make install-extensions   # Install from list
```

### Tmux Plugins
```bash
# Install TPM first
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Then in tmux: <prefix> + I to install plugins
```

### Reload Configurations
```bash
# Zsh
source ~/.zshrc
# or
zs

# Tmux (from within tmux)
tmux source ~/.tmux.conf
```