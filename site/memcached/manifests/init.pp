class memcached {

  package { 'memcached':
    ensure => installed,
  }
  
  service { 'memcached':
    ensure => running,
    requires => File['/etc/sysconfig/memcached'],
  }
  
  file { '/etc/sysconfig/memcached':
    ensure => file,
    source => 'puppet:///memcached/sysconfig',
    requires => Package['memcached'],
  }
}
