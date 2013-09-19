define coldfusion::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'coldfusion_10',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
    require => File["/etc/init.d/${service}"],
  }

  file { "/etc/init.d/${service}":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
