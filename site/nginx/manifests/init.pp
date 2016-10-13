class nginx {

yumrepo { 'updates':
  ensure     => 'present',
  descr      => 'CentOS-$releasever - Updates',
  enabled    => '1',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra',
}
  package { 'nginx':
    ensure => installed,
    require => Yumrepo['updates'],
  }
  
  # Set default
  File { 
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
  
  file { '/var/www':
    ensure => directory,
  }
  
  file { '/var/www/index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }
    
  file { '/etc/nginx/nginx.conf':
    ensure => file,
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
