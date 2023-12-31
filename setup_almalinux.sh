#!/bin/bash

# Set the hostname
if [ ! -z "$VM_HOSTNAME" ]; then
    hostnamectl set-hostname $VM_HOSTNAME
fi

# Update packages
sudo yum update -y

# Install & configure firewalld
sudo yum install -y firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload

# SSH Hardening
echo "
PermitRootLogin no
PasswordAuthentication no
" | sudo tee -a /etc/ssh/sshd_config

# Create an admin user and set up SSH access
ADMIN_USER="adminuser"
sudo useradd -m -s /bin/bash $ADMIN_USER
sudo usermod -aG wheel $ADMIN_USER

# Setup SSH key for the new admin user
PUBLIC_SSH_KEY="YOUR_PUBLIC_SSH_KEY"
sudo mkdir -p /home/$ADMIN_USER/.ssh
echo $PUBLIC_SSH_KEY | sudo tee /home/$ADMIN_USER/.ssh/authorized_keys
sudo chown -R $ADMIN_USER:$ADMIN_USER /home/$ADMIN_USER/.ssh
sudo chmod 700 /home/$ADMIN_USER/.ssh
sudo chmod 600 /home/$ADMIN_USER/.ssh/authorized_keys

# Restart SSH service
sudo systemctl restart sshd
