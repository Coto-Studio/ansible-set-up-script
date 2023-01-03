# -*- mode: ruby -*-
# vi: set ft=ruby :

role = File.basename(File.expand_path(File.dirname(__FILE__)))

boxes = [
  {
    :name => "ubuntu-2004",
    :box => "jharoian3/ubuntu-20.04-arm64",
    :ip => '10.0.0.14',
    :cpu => "50",
    :ram => "1024"
  },
]

Vagrant.configure("2") do |config|
  boxes.each do |box|
    config.vm.define box[:name] do |vms|
      vms.vm.box = box[:box]
      vms.vm.hostname = "ansible-#{role}-#{box[:name]}"

      vms.vm.provider "parallels" do |v|
        v.memory = box[:ram]
      end

      vms.vm.network "private_network", ip: box[:ip]

      vms.vm.provision "shell", path: "set-up.sh"
    end
  end
end