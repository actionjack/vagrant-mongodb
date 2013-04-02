# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"

  config.vm.define :mongo1 do |mongo1_config|
    mongo1_config.vm.box = "mongo1"
    mongo1_config.vm.forward_port 27017, 27017
    mongo1_config.vm.forward_port 28017, 28017
    mongo1_config.vm.provision :puppet do |mongo1puppet|
     mongo1puppet.manifests_path = "puppet/manifests"
     mongo1puppet.module_path    = "puppet/modules"
     mongo1puppet.options        = "--verbose --hiera_config hiera.yaml"
     mongo1puppet.manifest_file  = "init.pp"
     mongo1puppet.facter         =  { "cfn_roles" => "mongodb" } 
    end
  end
end

