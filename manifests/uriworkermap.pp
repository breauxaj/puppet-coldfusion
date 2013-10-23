define coldfusion::uriworkermap (
  $workers = '',
) {
  file { "${wsconfig}/uriworkermap.properties":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('coldfusion/uriworkermap.erb'),
  }

}
