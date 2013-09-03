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
