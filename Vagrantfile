# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "wheezy-7.1-x64"
  config.vm.box_url = "http://pectoribus.net/wheezy-7.1-x64.box"

  config.vm.hostname = "vagrant-vm"

  config.vm.network :private_network, ip: "192.168.50.2"

  config.vm.synced_folder "salt/root/", "/srv/salt/"

  config.vm.provision :salt do |salt|

    salt.minion_config = "salt/minion_config"
    salt.run_highstate = true
    # salt.verbose = true

  end

end
