class sources {

	class { 'apt':
		always_apt_update    => false,
		disable_keys         => undef,
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
		key        => '5A16E7281BE7A449',
                key_server => 'keys.gnupg.net',
		include_src	=> false
	}

	apt::source { "puppet_ubuntu_archiv_quantal_universe" :
		location    => "http://archive.ubuntu.com/ubuntu",
		release	    => "quantal",
		repos	    => "universe",
		key         => '3B4FE6ACC0B21F32',
		key_server  => 'keys.gnupg.net',
		include_src => false
	}
}
