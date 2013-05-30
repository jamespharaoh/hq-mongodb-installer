Vagrant.configure "2" do
	|config|

	config.vm.box = "quantal64"
	config.vm.box_url = "http://dl.dropbox.com/u/13510779/lxc-quantal-amd64-2013-05-08.box"

	config.vm.define :config do
		|config_config|

		config_config.vm.provision :shell,
			:inline => "sudo ifconfig eth0:0  192.168.222.2"
	end

	config.vm.define :data do
		|data_config|

		data_config.vm.provision :shell,
			:inline => "sudo ifconfig eth0:0  192.168.222.3"

	end

	config.vm.define :shard do
		|shard_config|

		shard_config.vm.provision :shell,
			:inline => "sudo ifconfig eth0:0  192.168.222.4"

	end

end
