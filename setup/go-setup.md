# Go Development Setup

## Installation

### openSUSE/SUSE
```bash
sudo zypper install go
```

### Manual Installation (Latest Version)
```bash
# Download latest version (check https://go.dev/dl/ for current version)
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz

# Remove old installation (if exists)
sudo rm -rf /usr/local/go

# Extract to /usr/local
sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz

# Clean up
rm go1.22.0.linux-amd64.tar.gz
```

## Environment Configuration

The following environment variables are already configured in `shell/zshrc`:

```bash
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/development/workspace/go"
export GOBIN="$HOME/development/workspace/go/bin"
```

## Post-Installation

Create Go workspace directories:

```bash
mkdir -p ~/development/workspace/go/{bin,pkg,src}
```

Reload shell configuration:

```bash
source ~/.zshrc
# or
zs
```

## Verification

```bash
# Check Go version
go version

# Check environment
go env GOPATH
go env GOBIN

# Test installation
go run -h
```

## Common Commands

```bash
# Initialize a new module
go mod init example.com/project

# Install dependencies
go mod download
go mod tidy

# Build current project
go build

# Run current project
go run .

# Install a package globally
go install example.com/tool@latest

# Format code
go fmt ./...

# Run tests
go test ./...

# Update dependencies
go get -u ./...
```

## Docker Container (Alternative)

An alias for running Go in Docker is configured in `shell/zshrc`:

```bash
alias godocker='docker run --rm -it -v /home/acika/development/workspace/go:/go -p 8080:8080 --hostname go-host --name golang acikabubo/go'
```

Usage:
```bash
godocker  # Starts Go development container
```

## Useful Tools

```bash
# Install common Go tools
go install golang.org/x/tools/gopls@latest        # Language server
go install golang.org/x/tools/cmd/goimports@latest # Import formatter
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest # Linter
```
