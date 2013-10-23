coldfusion
==========

Warning: this module does not install Coldfusion, it simply manages the service
and sets certain environment values as well as enforces folder permissions on
the base install location (since it seems to flip to 0777 on it's own).

Samples
-------
```
include coldfusion
```
```
coldfusion::service { 'default': ensure => running, enable => true }
```
$clusters = {
  clus1 => { balance_workers => [ 'inst1', 'inst2' ] }
  clus2 => { balance_workers => [ 'inst3', 'inst4' ] }
}
```
$workers = {
  inst1 => { host => 'localhost', port => '8012' },
  inst2 => { host => 'localhost', port => '8013' },
  inst3 => { host => 'localhost', port => '8014' },
  inst4 => { host => 'localhost', port => '8015' },
}
```
```
coldfusion::workers { 'default':
  clusters => $clusters,
  workers => $workers,
}
```