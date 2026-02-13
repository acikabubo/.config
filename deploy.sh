#!/bin/bash
# Deploy dotfiles from repository to system locations
# Usage: ./deploy.sh [--force]

set -e  # Exit on error

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FORCE=false

# Parse arguments
if [[ "$1" == "--force" ]]; then
    FORCE=true
fi

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to create symlink with backup
create_symlink() {
    local src="$1"
    local dest="$2"
    local dest_dir=$(dirname "$dest")

    # Create destination directory if it doesn't exist
    if [[ ! -d "$dest_dir" ]]; then
        echo -e "${YELLOW}Creating directory: $dest_dir${NC}"
        mkdir -p "$dest_dir"
    fi

    # Handle existing files
    if [[ -e "$dest" ]] || [[ -L "$dest" ]]; then
        if [[ "$FORCE" == true ]]; then
            echo -e "${YELLOW}Removing existing: $dest${NC}"
            rm -rf "$dest"
        else
            echo -e "${YELLOW}Backing up: $dest -> $dest.backup${NC}"
            mv "$dest" "$dest.backup"
        fi
    fi

    # Create symlink
    echo -e "${GREEN}Linking: $src -> $dest${NC}"
    ln -sf "$src" "$dest"
}

echo "========================================="
echo "  Dotfiles Deployment"
echo "========================================="
echo ""

# Shell configurations
echo -e "${GREEN}[Shell]${NC}"
create_symlink "$REPO_DIR/shell/zshrc" "$HOME/.zshrc"
echo ""

# Terminal configurations
echo -e "${GREEN}[Terminal]${NC}"
create_symlink "$REPO_DIR/terminal/ghostty/config" "$HOME/.config/ghostty/config"
echo ""

# Tmux configuration
echo -e "${GREEN}[Tmux]${NC}"
echo "Which tmux configuration would you like to deploy?"
echo "1) Standard tmux.conf"
echo "2) Ghostty-optimized tmux-ghostty.conf"
read -p "Enter choice [1-2] (default: 1): " tmux_choice
tmux_choice=${tmux_choice:-1}

if [[ "$tmux_choice" == "2" ]]; then
    create_symlink "$REPO_DIR/terminal/tmux/tmux-ghostty.conf" "$HOME/.tmux.conf"
else
    create_symlink "$REPO_DIR/terminal/tmux/tmux.conf" "$HOME/.tmux.conf"
fi
echo ""

# VSCode configurations
echo -e "${GREEN}[VSCode]${NC}"
create_symlink "$REPO_DIR/editors/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
create_symlink "$REPO_DIR/editors/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
create_symlink "$REPO_DIR/editors/vscode/snippets" "$HOME/.config/Code/User/snippets"
echo ""

# Zed configurations
echo -e "${GREEN}[Zed]${NC}"
create_symlink "$REPO_DIR/editors/zed/settings.json" "$HOME/.config/zed/settings.json"
create_symlink "$REPO_DIR/editors/zed/keymap.json" "$HOME/.config/zed/keymap.json"
create_symlink "$REPO_DIR/editors/zed/tasks.json" "$HOME/.config/zed/tasks.json"
create_symlink "$REPO_DIR/editors/zed/snippets" "$HOME/.config/zed/snippets"
echo ""

# Vim/Neovim configurations
echo -e "${GREEN}[Vim/Neovim]${NC}"
create_symlink "$REPO_DIR/editors/vim/vimrc" "$HOME/.vimrc"
create_symlink "$REPO_DIR/editors/vim/init.vim" "$HOME/.config/nvim/init.vim"
echo ""

echo "========================================="
echo -e "${GREEN}Deployment complete!${NC}"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Reload shell: source ~/.zshrc"
echo "2. Install VSCode extensions: cd $REPO_DIR/editors/vscode && make install-extensions"
echo "3. Install tmux plugins: Launch tmux and press <prefix> + I"
echo "4. See setup/ directory for additional installation guides"
