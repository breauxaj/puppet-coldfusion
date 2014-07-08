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
