define coldfusion::workers (
  $clusters = '',
  $workers = ''
) {
  $jkd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/httpd/jk.d',
  }

  file { "${jkd}/workers.properties":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('coldfusion/workers.erb'),
  }

}
