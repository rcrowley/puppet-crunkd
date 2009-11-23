class python {

	package {
		"python": ensure => latest;
		"python-setuptools": ensure => latest;
		"python-mysqldb": ensure => latest;
	}
	exec {
		"easy_install django": require => Package["python-setuptools"];
		"easy_install oauth==1.0": require => Package["python-setuptools"];
		"easy_install BeautifulSoup": require => Package["python-setuptools"];
		"easy_install fabric": require => Package["python-setuptools"];
	}

}
