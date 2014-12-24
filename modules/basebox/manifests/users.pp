class basebox::users {
  user { 'vagrant':
    ensure     => present,
    managehome => true,
    password   => '$6$SjA0kU11$u2YwIKJ8/QYP0boPatc1y6EtYzc3yzidlNZySbfQrbydFTxwG93BvOhqmWZNAX0ibNUE0k4GJrLL5KRg3i1rF.',
  } ->
  file { '/home/vagrant/.ssh':
    ensure => directory,
    mode   => '0700',
  } ->
  file { '/home/vagrant/.ssh/authorized_keys':
    mode   => '0600',
    source => 'puppet:///modules/basebox/vagrant.pub',
  }
  
  user { 'root':
    ensure     => present,
    password   => '$6$taZTXO5P$uF3Czmph4qRHMX1cz1gCzB4KIj4U2Q9xgf6GLnk3oQdInuI8CzI7uVmgw3mKLzClUR0iOv91sfyIQS1XHV2gb.',
  }
}
