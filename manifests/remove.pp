class coldfusion::remove {
  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ '/opt/coldfusion10' ],
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'coldfusion_10',
  }

  file { '/etc/profile.d/coldfusion.sh':
    ensure => absent,
  }

  file { "/etc/init.d/${service}":
    ensure => absent,
  }

  file { $paths:
    ensure  => absent,
    recurse => true,
    purge   => true,
    force   => true,
  }

  service { $service:
    ensure  => stopped,
    enable  => false,
    require => [
      File["/etc/init.d/${service}"],
      File[$paths],
    ],
  }

}