/*
file { '/var/www/html':
	ensure => directory,
	recurse => true,
}
*/

/*
exec { 'create /var/www/html':
	command: 'mkdir -p /var/www/html'
}
*/


package { 'httpd':
	ensure => 'installed',
	notify => File['index.html'],
}

file { 'index.html':
	source => 'puppet:///modules/attempt00/index.html',
	path => '/var/www/html/index.html',
	mode => 'uga+r',
	before => Exec['za_curl'],
}

exec { 'za_curl':
    command => 'curl http://localhost',
    path => '/usr/bin:/usr/sbin:/bin:/sbin'
}

