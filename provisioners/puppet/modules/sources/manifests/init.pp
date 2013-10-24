class sources {

	class { 'apt':
		always_apt_update    => false,
		disable_keys         => undef,
		proxy_host           => false,
		proxy_port           => '',
		purge_sources_list   => false,
		purge_sources_list_d => false,
		purge_preferences_d  => false,
		update_timeout       => undef
	}

	include apt

	apt::source { "puppet_hhvm_main" :
		location		=> "http://dl.hhvm.com/ubuntu",
		release			=> "precise",
		repos				=> "main",
		include_src	=> false
	}

	apt::source { "puppet_ubuntu_archiv_precise_universe" :
		location		=> "http://archive.ubuntu.com/ubuntu",
		release			=> "precise",
		repos				=> "universe",
		include_src	=> false
	}
}
