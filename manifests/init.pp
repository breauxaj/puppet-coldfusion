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
  file { '/etc/httpd/conf.d/jk.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/coldfusion/jk.conf',
  }

  file { '/etc/httpd/jk.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file { '/usr/lib64/httpd/mod_jk22.so':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/coldfusion/mod_jk22.so',
  }

}
