# Vagrant VM Provisioning

This repository contains Vagrant configurations and provisioning scripts to set up Ubuntu 22.04 and AlmaLinux 9 VMs with VirtualBox.

## Setup

1. **Clone the Repository**:
   ```bash
   git clone <REPO_URL>
   ```

## Personalize the Configuration

Before you run the VMs, make sure to customize the following:

- **Vagrantfile**:

  - Ensure you specify the correct network adapter for bridged networking.

- **setup.sh**:
  - Replace `YOUR_PUBLIC_SSH_KEY` with your actual public SSH key. This key will be used for SSH access to the VM.
  - (Optional) Modify the `ADMIN_USER` variable if you wish to use a different admin username.

## Launch VMs with Vagrant:

    ```bash
    vagrant up
    ```
<<<<<<< HEAD
    
=======

>>>>>>> 3a03a95c9a7d18c3561e694d0a357f812da1def9
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
