# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.define "ubuntu1" do |ubuntu|
    ubuntu.vm.box = "generic/ubuntu2204"
    ubuntu.vm.hostname = "ubuntu1"
    ubuntu.vm.network "public_network", bridge: "Intel(R) Ethernet Connection"
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    ubuntu.vm.provision "shell", path: "setup.sh", env: {"VM_HOSTNAME" => "ubuntu1"}
  end

  config.vm.define "ubuntu2" do |ubuntu|
    ubuntu.vm.box = "generic/ubuntu2204"
    ubuntu.vm.hostname = "ubuntu2"
    ubuntu.vm.network "public_network", bridge: "Intel(R) Ethernet Connection"
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    ubuntu.vm.provision "shell", path: "setup.sh", env: {"VM_HOSTNAME" => "ubuntu2"}
  end

  config.vm.define "almalinux" do |almalinux|
    almalinux.vm.box = "almalinux/9"
    almalinux.vm.hostname = "almalinux"
    almalinux.vm.network "public_network", bridge: "Intel(R) Ethernet Connection"
    almalinux.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    almalinux.vm.provision "shell", path: "setup.sh", env: {"VM_HOSTNAME" => "almalinux"}
  end

end
