# -*- mode: ruby -*-
# vi: set ft=ruby :

# Define constants for easier configuration
VM_NAME_1 = "ubuntu1"
VM_NAME_2 = "ubuntu2"
VM_NAME_3 = "almalinux"
VM_NETWORK_ADAPTER = "YOUR_NETWORK_ADAPTER_HERE"  # e.g. "Intel(R) Ethernet Connection"

Vagrant.configure("2") do |config|
  
  # Ubuntu VM Configuration
  config.vm.define VM_NAME_1 do |ubuntu|
    ubuntu.vm.box = "generic/ubuntu2204"
    ubuntu.vm.hostname = VM_NAME_1
    ubuntu.vm.network "public_network", bridge: VM_NETWORK_ADAPTER
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      end
    ubuntu.vm.provision "shell", path: "setup_ubuntu.sh", env: {"VM_HOSTNAME" => VM_NAME_1}
  end

  # Second Ubuntu VM Configuration
  config.vm.define VM_NAME_2 do |ubuntu|
    ubuntu.vm.box = "generic/ubuntu2204"
    ubuntu.vm.hostname = VM_NAME_2
    ubuntu.vm.network "public_network", bridge: VM_NETWORK_ADAPTER
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      end
    ubuntu.vm.provision "shell", path: "setup_ubuntu.sh", env: {"VM_HOSTNAME" => VM_NAME_2}
  end

  # AlmaLinux VM Configuration
  config.vm.define VM_NAME_3 do |almalinux|
    almalinux.vm.box = "almalinux/9"
    almalinux.vm.hostname = VM_NAME_3
    almalinux.vm.network "public_network", bridge: VM_NETWORK_ADAPTER
    almalinux.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      end
    almalinux.vm.provision "shell", path: "setup_almalinux.sh", env: {"VM_HOSTNAME" => VM_NAME_3}
  end

end
