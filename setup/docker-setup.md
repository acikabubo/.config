# Docker Setup with XFS Filesystem

## Why Docker + XFS?

Docker with XFS is an excellent combination:

- Docker's overlay2 storage driver works great with XFS
- Handles many container layers efficiently
- Better performance with image pulls/builds (lots of metadata operations)
- Excellent for Docker volumes with databases (PostgreSQL, etc.)
- Handles the constant file creation/deletion from container churn very well
- XFS's parallel I/O shines when running multiple containers

## Installation

### Option 1: Before Installing Docker

```bash
# Create Docker storage directory on XFS partition
sudo mkdir -p /home/docker

# Create symlink
sudo ln -s /home/docker /var/lib/docker

# Install Docker
sudo zypper install docker
sudo systemctl enable docker
sudo systemctl start docker
```

### Option 2: After Docker Is Already Installed

```bash
# Stop Docker service
sudo systemctl stop docker

# Move existing Docker data
sudo mv /var/lib/docker /home/docker

# Create symlink
sudo ln -s /home/docker /var/lib/docker

# Start Docker service
sudo systemctl start docker
```

## Post-Installation

### Run Docker Without Sudo

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

## Verification

```bash
# Verify Docker is using the correct storage location
docker info | grep "Docker Root Dir"
# Should show: /var/lib/docker (which symlinks to /home/docker)

# Verify storage driver
docker info | grep "Storage Driver"
# Should show: overlay2
```
