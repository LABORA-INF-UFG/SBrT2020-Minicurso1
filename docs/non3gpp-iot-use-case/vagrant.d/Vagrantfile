Vagrant.configure("2") do |config|
  config.vm.define "free5gc-compose"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192
    vb.cpus = 4
  end

  config.vm.hostname = "free5gc"
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.synced_folder "shared", "/vagrant", disabled: false
  
  config.vm.provision "shell", path: "pre-config.sh"
  config.vm.provision :reload
  config.vm.provision "shell", path: "post-config.sh"

end
