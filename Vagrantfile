# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure("2") do |config|
	config.vm.box = "precise64"
	config.vm.box_url = "http://files.vagrantup.com/precise64.box"
	config.vm.hostname = "vagrant-hhvm.localhost"
	config.ssh.forward_agent = true

	config.vm.network :private_network, ip: "192.168.99.99"

	config.vm.provision :shell do |shell|
		shell.inline = "mkdir -p /etc/puppet/modules; puppet module install puppetlabs/apt"
	end

	config.vm.provision :puppet do |puppet|
		puppet.manifests_path = "provisioners/puppet/manifests"
		puppet.manifest_file  = "base.pp"
		puppet.module_path = "provisioners/puppet/modules"
	end
end
