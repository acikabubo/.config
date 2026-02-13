# Tmux Plugin Manager (TPM) Setup

## Installation

Clone TPM repository:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Usage

### Installing Plugins

After adding plugins to your `tmux.conf` file:

1. Reload tmux configuration:
   ```bash
   tmux source ~/.tmux.conf
   ```

2. Install plugins (from within tmux):
   ```
   <prefix> + I
   ```
   (Note: prefix is `Insert` key in this configuration)

### Managing Plugins

- **Install plugins**: `<prefix> + I`
- **Update plugins**: `<prefix> + U`
- **Remove plugins**: `<prefix> + alt + u` (uninstalls plugins not listed in config)

## Configured Plugins

The following plugins are configured in `terminal/tmux/tmux.conf`:

- `tmux-plugins/tpm` - Plugin manager
- `tmux-plugins/tmux-sidebar` - Tree-style file browser
- `tmux-plugins/tmux-resurrect` - Save/restore tmux sessions
- `tmux-plugins/tmux-continuum` - Automatic session saving
- `tmux-plugins/tmux-prefix-highlight` - Highlight prefix key status

## Adding New Plugins

1. Add plugin to `terminal/tmux/tmux.conf`:
   ```bash
   set -g @plugin 'username/plugin-name'
   ```

2. Reload tmux config and install:
   ```
   <prefix> + I
   ```
