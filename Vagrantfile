private_key = File.expand_path(File.join(Dir.home, '.ssh/id_rsa'))
public_key = File.expand_path(File.join(Dir.home, '.ssh/id_rsa.pub'))

Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.hostname = "docker-enviroment"
	config.vm.box_check_update = false
	config.ssh.insert_key = false
	#config.vm.provision "shell", path: "setup.sh"
	config.vm.synced_folder Dir.home, "/home/vagrant/shared/", create:true
    config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"
	config.ssh.forward_agent = true
	
	config.vm.network :forwarded_port, guest:80, host:80, auto_correct: true 
	config.vm.network :forwarded_port, guest:443, host:443, auto_correct: true 
	config.vm.network :forwarded_port, guest:3306, host:3306, auto_correct: true #mysql
	config.vm.network :forwarded_port, guest:50000 , host:50000 , auto_correct: true #Jenkins
	config.vm.network :forwarded_port, guest:8080 , host:8080 , auto_correct: true #Jenkins
	config.vm.network :public_network, brigde: 'eth0'
	
	config.vm.provider "virtualbox" do |v|
		v.name = "docker-enviroment"
		v.customize ['modifyvm', :id, '--memory', '2048']
        v.customize ['modifyvm', :id, '--cpus', '1']
        v.customize ['modifyvm', :id, '--ioapic', 'on']
	end

	# copy some files to VM
	#https://www.vagrantup.com/docs/synced-folders/basic_usage.html
    #http://stackoverflow.com/questions/16704059/easiest-way-to-copy-a-single-file-from-host-to-vagrant-guest
end	
