# Define: coldfusion::config
#
# This define sets environment variables and install location
#
# Parameters:
#
#  cf_home:
#    Specify where ColdFusion is installed
#
#  owner:
#    Enforce the owner of the install folder
#
#  group:
#    Enforce the group of the install folder
#
# Actions:
#   - Creates a profile.d script to set environment variable
#   - Manage owner/group of install folder
#   - Configure init scripts via sysconfig file
#
# Requires:
#
# Sample Usage:
#
#  To setup install path and hint for init scripts, use:
#
#    coldfusion::config { 'default':
#      cf_home => '/opt/coldfusion10',
#      owner   => 'deploy',
#      group   => 'deploy'
#    }
#
define coldfusion::config (
  $cf_home = '/opt/coldfusion10',
  $owner = 'deploy',
  $group = 'deploy'
) {
  file { $cf_home:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0775',
  }

  file { '/etc/profile.d/coldfusion.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('coldfusion/profile.erb'),
  }

  file { '/etc/sysconfig/coldfusion':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('coldfusion/sysconfig.erb'),
  }

}
