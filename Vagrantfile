# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "bamboo-nodejs-mocha"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"  
  config.vm.network :forwarded_port, guest: 8085, host: 8085
  config.vm.boot_timeout = 120
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "./Berksfile"
  config.omnibus.chef_version = :latest
  
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }

    chef.run_list = [
        "recipe[bamboo-nodejs-mocha::default]",
        "recipe[bamboo-nodejs-mocha::mysql]",
    ]
  end
end
