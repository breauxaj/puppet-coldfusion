class coldfusion {
  $paths = $operatingsystem ? {
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

}

define coldfusion::service ( $ensure,
                             $enable ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'coldfusion_10',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
    require => File["/etc/init.d/${service}"],
  }

  file { "/etc/init.d/${service}":
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }

}
