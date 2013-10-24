# Vagrant HHVM
This is a really basic Vagrant machine, to test HHVM. It will also contain Nginx (as the front server for HHVM) and MySQL. It is provisioned by Puppet and Shell. Shell provisioner is used to add the [apt](https://forge.puppetlabs.com/puppetlabs/apt) Puppet Module since I use apt to properly install HHVM.

Also, the Puppet module used to install HHVM is hard coded with the version to make sure Puppet uses `--force-yes` when installing.

You can use this machine for whatever you desire, or to get to know HHVM in a very small environment.

Do note that the machine might be lacking many things, since I am just getting to know HHVM. The configuration files for the services are basic and not tuned for anything.

## Installing

1. Make sure you have [VirtualBox](https://www.virtualbox.org/).
2. [Install Vagrant](http://docs.vagrantup.com/v2/installation/).
3. Clone this repository or download it as a zip.
4. Add an entry in your host file for `vagrant-hhvm.localhost` with IP `192.168.99.99`
5. In the terminal, go to the folder where you cloned or unzipped the files and type `vagrant up`.

Step 4 is important because Nginx is configured to deny all anonymous requests, and only pass the request to HHVM by server name. You are free to change this, but I just like the idea: [Using nginx as Front Server to HipHop](https://github.com/facebook/hhvm/wiki/Using-nginx-as-Front-Server-to-HipHop#etcnginxsites-enableddefault)