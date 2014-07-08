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
  $confd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/httpd/conf.d',
  }

  $jkd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/httpd/jk.d',
  }

  $modules = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/usr/lib64/httpd',
  }

  file { "${confd}/jk.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/coldfusion/jk.conf',
  }

  file { $jkd:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file { "${modules}/mod_jk22.so":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/coldfusion/mod_jk22.so',
  }

}
