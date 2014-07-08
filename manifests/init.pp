# Class: coldfusion
#
# This class installs the mod_jk22 connector
#
# Parameters:
#
# Actions:
#   - Install the connector
#
# Requires:
#
#   Package httpd
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'coldfusion': }
#
class coldfusion {
  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'httpd' ],
  }

  $confd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/httpd/conf.d',
  }

  $jkd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/httpd/jk.d',
  }

  $modules = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/usr/lib64/httpd/modules',
  }

  file { "${modules}/mod_jk22.so":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/coldfusion/mod_jk22.so',
    require => Package[$depends],
  }

  file { "${confd}/jk.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/coldfusion/jk.conf',
    require => Package[$depends],
  }

  file { $jkd:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package[$depends],
  }

}
