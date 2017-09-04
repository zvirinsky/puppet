
Vagrant.configure("2") do |config|
  config.vm.define "srv-puppet" do |server|
    server.vm.define "srv-puppet"
    server.vm.box = "centos73-min.box"
    server.vm.box_url = "./centos73-min.box"
    server.vm.hostname = "srv-puppet"
    server.vm.network "private_network", ip: "192.168.56.100"
    server.vm.provider "virtualbox" do |vb|
      vb.memory = "3072"
    end
  end

#client 1

  config.vm.define "puppet-client1" do |client|
    client.vm.define "puppet-client1"
    client.vm.box = "centos73-min.box"
    client.vm.box_url = "./centos73-min.box"
    client.vm.hostname = "puppet-client1"
    client.vm.network "private_network", ip: "192.168.56.101"
    client.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
  end

#puppet enterprise
#
  config.vm.define "srv-puppet-e" do |server|
    server.vm.define "srv-puppet-e"
    server.vm.box = "centos73-min.box"
    server.vm.box_url = "./centos73-min.box"
    server.vm.hostname = "srv-puppet-e"
    server.vm.network "private_network", ip: "192.168.56.200"
    server.vm.provider "virtualbox" do |vb|
      vb.memory = "3072"
    end
  end
#
#centos client
#
config.vm.define "puppet-client-e" do |client|
    client.vm.define "puppet-client-e"
    client.vm.box = "centos73-min.box"
    client.vm.box_url = "./centos73-min.box"
    client.vm.hostname = "puppet-client-e"
    client.vm.network "private_network", ip: "192.168.56.201"
    client.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
  end

#ubuntu client
#
config.vm.define "puppet-client-u" do |client|
    client.vm.define "puppet-client-u"
    client.vm.box = "ubuntu/trusty64"
    client.vm.hostname = "puppet-client-u"
    client.vm.network "private_network", ip: "192.168.56.202"
    client.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
  end

#zabbix server
#
config.vm.define "zabbix-server" do |client|
    client.vm.define "zabbix-server"
    client.vm.box = "centos73-min.box"
    client.vm.box_url = "./centos73-min.box"
    client.vm.hostname = "zabbix-server"
    client.vm.network "private_network", ip: "192.168.56.203"
    client.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
  end

end
