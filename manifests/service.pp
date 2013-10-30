define coldfusion::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'coldfusion_10',
  }

  service { "${service}_${name}":
    ensure  => $ensure,
    enable  => $enable,
    require => File["/etc/init.d/${service}_${name}"],
  }

  file { $name:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    path    => "/etc/init.d/${service}_${name}",
    content => template('coldfusion/init.erb'),
  }

}
