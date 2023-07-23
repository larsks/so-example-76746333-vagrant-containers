$script = <<-SCRIPT
#!/bin/sh
apk update
apk add python3
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |d|
    d.image = "alpine-ssh"
    d.remains_running = true
    d.has_ssh = true
  end

  config.vm.provision "shell", inline: $script
end
