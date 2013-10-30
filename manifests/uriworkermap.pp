define coldfusion::uriworkermap {
  file { "/etc/httpd/jk.d/uri-${name}-map.properties":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('coldfusion/uriworkermap.erb'),
    require => File['/etc/httpd/jk.d'],
  }

}
