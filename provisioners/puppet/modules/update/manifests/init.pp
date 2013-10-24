class update {
	require sources

	exec { "apt-get update" :
		path => "/usr/bin"
	}
}