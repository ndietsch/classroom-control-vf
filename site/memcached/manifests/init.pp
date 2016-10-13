class memcached {

  package { 'memcached':
    ensure => installed,
  }
  
  service { 'memcached':
    ensure => running,
    require => File['/etc/sysconfig/memcached'],
  }
  
  file { '/etc/sysconfig/memcached':
    ensure => file,
    source => 'puppet:///modules/memcached/sysconfig',
    require => Package['memcached'],
  }
}
