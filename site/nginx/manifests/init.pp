class nginx {

  package { 'nginx':
    ensure => installed,
  }
  
  file { '/var/www':
    ensure => directory,
  }
  
  file { '/etc/nginx/nginx.conf':
    ensure => file
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }
  
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }
  
  service { 'nginx':
    ensure => running,
    require => File['/etc/nginx/nginx.conf'],
  }
}
