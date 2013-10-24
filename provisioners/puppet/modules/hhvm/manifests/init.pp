class hhvm {
	package { [ 'hhvm' ]:
		ensure => '2.2.0',
		require => Exec['apt-get update'],
	}

	file { 'config.hdf' :
		path => '/etc/hhvm/config.hdf',
		ensure => file,
		owner => root,
		group => root,
		source => "puppet:///modules/hhvm/config.hdf",
		require => Package['hhvm'],
		notify => Service['hhvm'],
	}

	file { 'vagrant-hhvm.localhost' :
		path => '/etc/nginx/sites-enabled/vagrant-hhvm.localhost',
		ensure => file,
		owner => root,
		group => root,
		source => "puppet:///modules/hhvm/vagrant-hhvm.localhost",
		require => Package['nginx'],
		notify => Service['nginx'],
	}

	file { 'var/www' :
		path => '/var/www',
		ensure => directory,
		owner => www-data,
		group => www-data,
		purge => false,
	}

	file { 'index.php' :
		path => '/var/www/index.php',
		ensure => file,
		owner => root,
		group => root,
		source => "puppet:///modules/hhvm/index.php",
	}

	service { 'hhvm':
		ensure => running,
		enable => true,
		require => Package['hhvm'],
  		binary     => '/usr/bin/hhvm',
  		hasrestart => true,
  		hasstatus  => false,
	}
}
