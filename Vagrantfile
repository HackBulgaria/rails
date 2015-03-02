# We need an rsync enabled version of Vagrant.
Vagrant.require_version('>= 1.5.1')

Vagrant.configure('2') do |config|
  config.vm.box      = 'hashicorp/precise64'
  config.vm.hostname = 'localhost'

  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    v.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  # The 80 port may be taken by an already running application server on the
  # host. Run it on 8080 or something different.
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Mount the shared folder with rsync, so we get a faster performance for the
  # applications.
  config.vm.synced_folder '.', '/vagrant', type: 'rsync'

  # Raise the open files limit to try to account for OSX + VirtualBox insanity.
  config.vm.provision :shell, inline: 'ulimit -n 4048'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
    puppet.options        = '--verbose --debug' if ENV['DEBUG']
  end

  # Let Vagrant start offline. You can always do manual `vagrant box update` if
  # needed.
  config.vm.box_check_update = false
end
