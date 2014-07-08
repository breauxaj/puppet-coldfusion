# Define: coldfusion::workers
#
# This define creates the workers.properties file
#
# Parameters:
#
#  clusters:
#    Specify the clusters as a hash, if used
#
#  workers:
#    Specify the workers as a hash
#
# Actions:
#   - Creates a workers.properties file in /etc/httpd/jk.d
#
# Requires:
#
# Sample Usage:
#
#  To define a clusters hash, use:
#
#       $clusters = {
#         c1 => { balance_workers => [ 'i1', 'i2' ] },
#         c2 => { balance_workers => [ 'i3', 'i4' ] },
#       }
#
#  To define a workers hash, use:
#       $workers = {
#         i1 => { host => '192.168.1.10', port => '8013' },
#         i2 => { host => '192.168.1.20', port => '8014' },
#       }
#
#  To call the define, use:
#       coldfusion::workers { 'default':
#         clusters => $clusters,
#         workers  => $workers,
#       }
#
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
