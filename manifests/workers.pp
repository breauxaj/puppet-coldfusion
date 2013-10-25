define coldfusion::workers (
  $clusters = '',
  $workers = ''
) {
  file { '/etc/httpd/jk.d/workers.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('coldfusion/workers.erb'),
    require => File['/etc/httpd/jk.d'],
  }

}
