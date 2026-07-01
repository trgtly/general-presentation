#!/bin/bash
set -e

echo "Starting server initialization for Ubuntu 22..."

# Update and upgrade system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install prerequisite packages
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key and repository
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg --yes
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine and Docker Compose Plugin
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Ensure docker is running and enabled on boot
sudo systemctl enable docker
sudo systemctl start docker

# Generate SSH keys for GitHub Actions deployment if not already present
SSH_KEY_PATH="$HOME/.ssh/github_actions_deploy"
if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "Generating SSH key for GitHub Actions..."
    ssh-keygen -t ed25519 -C "github-actions-deploy" -f "$SSH_KEY_PATH" -N ""
    
    # Add public key to authorized_keys so GitHub Actions can SSH into this machine
    cat "${SSH_KEY_PATH}.pub" >> "$HOME/.ssh/authorized_keys"
    chmod 600 "$HOME/.ssh/authorized_keys"
    
    echo "=========================================================="
    echo "Add the following PRIVATE KEY as a repository secret in GitHub (e.g. SERVER_SSH_KEY):"
    cat "$SSH_KEY_PATH"
    echo "=========================================================="
else
    echo "SSH key already exists at $SSH_KEY_PATH."
fi

# Create deployment directory
DEPLOY_DIR="$HOME/pitch"
mkdir -p "$DEPLOY_DIR"
echo "Deployment directory created at $DEPLOY_DIR"

echo "Server initialization complete."
