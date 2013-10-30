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

  file { '/usr/lib64/httpd/modules/mod_jk22.so':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/coldfusion/mod_jk22.so',
    require => Package['httpd'],
  }

  file { '/etc/httpd/conf.d/jk.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/coldfusion/jk.conf',
    require => Package['httpd'],
  }

  file { '/etc/httpd/jk.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['httpd'],
  }

}
