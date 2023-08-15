#!/bin/bash


# Set the hostname

if [ ! -z "$VM_HOSTNAME" ]; then
    hostnamectl set-hostname $VM_HOSTNAME
fi

# Update packages

sudo apt update && sudo apt upgrade -y || sudo yum update -y

# Install & configure UFW or firewalld

if [ -x "$(command -v ufw)" ]; then
    sudo apt install -y ufw
    sudo ufw allow OpenSSH
    sudo ufw enable
    elif [ -x "$(command -v firewall-cmd)" ]; then
    sudo yum install -y firewalld
    sudo systemctl start firewalld
    sudo systemctl enable firewalld
    sudo firewall-cmd --add-service=ssh --permanent
    sudo firewall-cmd --reload
fi

# Harden SSH

PermitRootLogin no
PasswordAuthentication no
" | sudo tee -a /etc/ssh/sshd_config

# Create an admin user and set up SSH access

ADMIN_USER="zoli"
sudo useradd -m -s /bin/bash $ADMIN_USER
sudo usermod -aG sudo $ADMIN_USER

# Setup SSH key for the new admin user

PUBLIC_SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKQUKT3I9kvB/KHC+KIFpxzItlpvabgaU3aH3pI/vNXlUfHn++1EsvTwOBzs7FU4VgPev8e1HJ05lEKTsOCz4zIMYh9FmGPcF7NDo+ZW1fKKcL9Fa+iAdNnM0kTNnHUDDcPVR7D0rPItTptOKNEa2zZAWxZmxqx6w0ABrSfJYM1j+l6MBJg2VcGPFzmi/DMOzbYnAbhP4pnDTmveiuKa06JGcIbDb2gMzXM6AwoJ0X5dVmMfNtfottl+AUkV1Ng9Q+vPrVIRAdZyU+fW+xhSfjVKVjIT13aMMpRvpfyxyHMf39Y5bhANpSOk7R28hvEEkZxla7S/Vdi4G8gPTQpIsLm+QRYd51MXHNw+KAChQII7tmGWXxrGpMkD6yQkPWz6x8nKdAfTOk+rdkcNVecrqIiOFLEt1l9QE6QL84F/65rS7wuiV3MTSV2OOdNit3jBMUhkaLyPIql+eKfpDo0IPJ1GhXmsRCCqtwfv5oGM25oRBgFUG4+8TjgtlNmBBIU6I8SyqOMTZs5K78oBU/Cmesbryu2wDrAndhmf0M/cSzT1d3jFqJhHRfSrtrTi4WDC+UEehh4SWJdwo+D1bGo1QJ8GobPF8oucy5XvtNk1R8n89MOYaQtMnIx7YAxBa4GFsvVlmr7HQceqSWQbKAarJbmwk6KXf3ACtymDEX4Ezk4Q=="
sudo mkdir -p /home/$ADMIN_USER/.ssh
echo $PUBLIC_SSH_KEY | sudo tee /home/$ADMIN_USER/.ssh/authorized_keys
sudo chown -R $ADMIN_USER:$ADMIN_USER /home/$ADMIN_USER/.ssh
sudo chmod 700 /home/$ADMIN_USER/.ssh
sudo chmod 600 /home/$ADMIN_USER/.ssh/authorized_keys

# Restart SSH service
sudo service ssh restart || sudo systemctl restart sshd
