# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.42.77"

  # Create a public network, which generally matched to bridged network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder.
  config.vm.synced_folder "../", "/vagrant", owner: "www-data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant.
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "1024", "--name", "guidelines.local"]
	vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end
  
  config.vm.provision "docker" do |d|
    
  end
  
  config.vm.provision :docker_compose, yml: "/vagrant/docker-compose/docker-compose.yml", run: "always"

  #######################################################
  ##         DO NOT EDIT CONFIGS BELOW HERE!!!         ##
  #######################################################

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Enable provisioning with Puppet stand alone.
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'init.pp'
    puppet.module_path = 'puppet/modules'
    puppet.options = "--verbose --debug"
  end

end
