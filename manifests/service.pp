# Define: coldfusion::service
#
# This define manages the Coldfusion service
#
# Parameters:
#
#  name:
#    Determines the actual name of the service by concatenation
#
#  ensure:
#    Controls the state of the service
#
#  enable:
#    Controls the service start on boot
#
# Actions:
#   - Stops/starts the Coldfusion service
#   - Stages the init script for use
#
# Requires:
#
# Sample Usage:
#
#  To enable the service, use:
#
#    coldfusion::service { 'cfusion':
#      ensure => running,
#      enable => true
#    }
#
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
