class apache {

	# Apache with mod_wsgi
	$port = 88
	package {
		"apache2": ensure => latest;
		"libapache2-mod-wsgi": ensure => latest;
	}
	file { "/etc/apache2/ports.conf":
		require => Package["apache2"],
		ensure => present,
		content => template("ports.conf.erb"),
	}
	file { "/etc/apache2/mods-enabled/wsgi.conf":
		require => Package["libapache2-mod-wsgi"],
		ensure => "../mods-available/wsgi.conf",
	}
	file { "/etc/apache2/mods-enabled/wsgi.load":
		require => Package["libapache2-mod-wsgi"],
		ensure => "../mods-available/wsgi.load",
	}

	file { "/etc/apache2/sites-available/crunkd":
		require => Package["libapache2-mod-wsgi"],
		ensure => present,
		content => template("crunkd.erb"),
	}
	file { "/etc/apache2/sites-enabled/crunkd":
		require => File["/etc/apache2/sites-available/crunkd"],
		ensure => "../sites-available/crunkd",
	}

	service { "apache2":
		subscribe => [
			Package["apache2"],
			Package["libapache2-mod-wsgi"],
			File["/etc/apache2/ports.conf"],
			File["/etc/apache2/mods-enabled/wsgi.conf"],
			File["/etc/apache2/mods-enabled/wsgi.load"],
			File["/etc/apache2/sites-available/crunkd"],
			File["/etc/apache2/sites-enabled/crunkd"]
		],
		ensure => running,
		enable => true,
	}

}
