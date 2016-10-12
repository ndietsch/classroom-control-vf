class skeleton {

  file { '/etc/skel':
    ensure => directory,
    before => File['/etc/skel/.bashrc'],
    }
    
    file  { '/etc/skel/.bashrc':
     ensure => file,
     source => 'puppet:///modules/skeleton/bashrc',
     }
