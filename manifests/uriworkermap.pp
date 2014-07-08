define coldfusion::uriworkermap {
  $jkd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/httpd/jk.d',
  }

  file { "${jkd}/uri-${name}-map.properties":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('coldfusion/uriworkermap.erb'),
  }

}
