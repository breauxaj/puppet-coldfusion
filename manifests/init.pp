class coldfusion {
  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ '/opt/coldfusion10' ],
  }

  file { $paths:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  file { '/etc/profile.d/coldfusion.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/coldfusion/coldfusion.profile'
  }

  file { '/etc/httpd/conf/mod_jk.conf':
    ensure => absent,
  }

}
