
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$tscript = <<TSCRIPT
set -o verbose
#echo "Additional packages"
apt-get update
apt-get install ssh
apt-get install sshpass
TSCRIPT

Vagrant.configure("2") do |config|

       config.vm.box = "ubuntu/trusty64"
       config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box"

	config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
       # vb.gui = true
        vb.memory = 8192
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        end

	config.vm.define "mysql1" do |mysql1|

		mysql1.vm.hostname = "mysql1"
		mysql1.vm.provision "shell", inline: $tscript
#                mysql1.vm.network :forwarded_port, guest: 80, host: 8080
#                mysql1.vm.network :private_network, ip: "192.168.1.88"
#                mysql1.vm.network :"public_network", ip: "192.168.1.90"
		mysql1.vm.network :"public_network", bridge: 'wlan0', ip:"192.168.1.85"         
       end
       
        config.vm.define "mysql2" do |mysql2|
                mysql2.vm.hostname = "mysql2"
                mysql2.vm.provision "shell", inline: $tscript
#                mysql2.vm.network :forwarded_port, guest: 80, host: 8080 
#                mysql2.vm.network :private_network, ip: "192.168.1.88"
#                mysql2.vm.network :"public_network", ip: "192.168.1.91"
                mysql2.vm.network :"public_network", bridge: 'wlan0', ip:"192.168.1.86"
        end

end
