IMAGE_NAME = "rhel8-ssh"
N = 3

Vagrant.configure("2") do |config|
    config.vm.provider "docker" do |d|
      d.image = IMAGE_NAME
      d.has_ssh = true
      d.remains_running = true
    end

    config.vm.define "controller" do |controller|
      controller.vm.hostname = "controller"
      controller.vm.network :public_network,
        ip: "192.168.1.160",
        bridge: "eth0",
        docker_network__ip_range: "192.168.1.160/29",
        docker_network__gateway: "192.168.1.1"
      controller.vm.provision "ansible" do |ansible|
        ansible.playbook = "controller-playbook.yaml"
      end
    end

    (1..N).each do |i|
      config.vm.define "node-#{i}" do |node|
        node.vm.hostname = "node-#{i}"
        node.vm.network :public_network,
          ip: "192.168.1.#{160 + i}",
          bridge: "eth0",
          docker_network__ip_range: "192.168.1.160/29",
          docker_network__gateway: "192.168.1.1"
        node.vm.provision "ansible" do |ansible|
          ansible.playbook = "node-playbook.yaml"
        end
      end
    end
end
