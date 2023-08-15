# Vagrant VM Provisioning

This repository contains Vagrant configurations and provisioning scripts to set up Ubuntu 22.04 and AlmaLinux 9 VMs with VirtualBox.

## Setup

- **Clone the Repository**:
   ```bash
   git clone https://github.com/z-somody/ansible-practice-vms-vagrant.git
   ```

- **Install Vagrant**: 
https://www.vagrantup.com/downloads.html

- **Create a directory for your VMs**

## Personalize the Configuration

Before you run the VMs, make sure to customize the following:

- **Vagrantfile**:
  - Adjust the VM names by changing the `VM_NAME_X` variables, for example "ubuntu1", "ubuntu2", or "almalinux".  
  - Replace the NETWORK_ADAPTER placeholder with the name of your primary network adapter for bridged networking. Example: `"Intel(R) Ethernet Connection"`

- **setup.sh**:
  - Replace `YOUR_PUBLIC_SSH_KEY` with your actual public SSH key.
  - (Optional) Modify the `ADMIN_USER` variable if you wish to use a different admin username.

## Steps to Provision

  - Open a terminal or command prompt.
  - Navigate to the directory containing the `Vagrantfile`.
  - Launch Vagrant with the following command to start and provision the virtual machines:


   ```bash
   vagrant up
   ```

# SSH Access

## Using Vagrant:

   ```bash
   vagrant ssh <VM_NAME>
   ```

## Direct SSH Access:

   ```bash
   ssh adminuser@<VM_IP>
   ```

- Ensure you've added your private SSH key to your SSH agent or specify it using the -i flag.
