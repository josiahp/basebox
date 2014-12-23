class basebox::virtualbox {
  file { '/mnt/cdrom':
    ensure => directory,
  } ->
  mount { '/mnt/cdrom':
    ensure   => 'mounted',
    atboot   => false,
    device   => '/dev/cdrom',
    fstype   => 'iso9660',
    options  => 'defaults',
    remounts => false,
  } ->
  exec { 'install guest additions':
    command => '/bin/echo yes | sh /mnt/cdrom/VBoxLinuxAdditions.run',
    onlyif  => "/bin/test -z \"`lsmod | grep vbox`\"",
    returns => [ '0', '1' ],
  }
}
