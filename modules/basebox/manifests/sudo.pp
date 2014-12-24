class basebox::sudo {
  exec { 'disable requiretty from sudoers':
    command => '/bin/sed -i"" "/requiretty/d" /etc/sudoers',
    onlyif  => '/bin/grep requiretty /etc/sudoers',
  }

  exec { 'allow vagrant to sudo':
    command => '/bin/echo "vagrant	ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers',
    unless  => '/bin/grep vagrant /etc/sudoers',
  }
}
