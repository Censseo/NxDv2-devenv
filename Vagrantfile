# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian10"

  config.vm.network "forwarded_port", guest: 8080, host: 9100, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 9000, host: 9101, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 1883, host: 1883, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 1880, host: 1880, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"

  config.vm.synced_folder "./src", "/nextdom"

  # VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
    vb.cpus = "6"
  end

  config.vm.provision "shell", path: "provision.sh"
end