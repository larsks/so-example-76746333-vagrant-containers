ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
IMAGE_NAME = "rhel8-ssh"
N = 3

Vagrant.configure("2") do |config|
    config.vm.provider "docker" do |d|
      d.image = IMAGE_NAME
      d.has_ssh = true
      d.remains_running = true
    end

    config.vm.network :public_network,
      type: "dhcp",
      bridge: "eth0",
      docker_network__ip_range: "192.168.1.160/29",
      docker_network__gateway: "192.168.1.1"

    config.vm.define "controller" do |controller|
      controller.vm.hostname = "controller"
      controller.vm.provision :shell, path: "setup.sh"
    end

    (1..N).each do |i|
      config.vm.define "node-#{i}" do |node|
        node.vm.hostname = "node-#{i}"
        node.vm.provision :shell, path: "setup.sh"
      end
    end
end
