class lighty {

	package {
		"lighttpd": ensure => latest;
	}
	file { "/etc/lighttpd/lighttpd.conf":
		require => Package["lighttpd"],
		ensure => present,
		content => template("lighttpd.conf.erb"),
	}

}
