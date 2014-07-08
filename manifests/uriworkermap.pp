# Define: coldfusion::uriworkermap
#
# This define creates the uriworkermap file
#
# Parameters:
#
#  name:
#    Specify the worker name
#
# Actions:
#   - Creates a uriworkermap file in /etc/httpd/jk.d
#
# Requires:
#
# Sample Usage:
#
#  To create a file, use:
#
#      coldfusion::uriworkermap { 'app_cluster': }
#
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
