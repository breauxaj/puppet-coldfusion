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
```
$clusters = {
  c1 => { balance_workers => [ 'i1', 'i2' ] },
  c2 => { balance_workers => [ 'i3', 'i4' ] },
}
```
```
$workers = {
  i1 => { host => 'h1', port => '8012' },
  i2 => { host => 'h2', port => '8012' },
  i3 => { host => 'h1', port => '8013' },
  i4 => { host => 'h2', port => '8013' },
}
```
```
coldfusion::workers { 'default':
  clusters => $clusters,
  workers => $workers,
}
```