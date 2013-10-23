define coldfusion::uriworkermap (
  $worker = '',
) {
  file { "/etc/httpd/jk.d/uri-${worker}-map.properties":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('coldfusion/uriworkermap.erb'),
  }

}
