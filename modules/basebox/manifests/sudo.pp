class basebox::sudo {
  exec { 'disable requiretty from sudoers':
    command => '/bin/sed -i"" "/requiretty/d" /etc/sudoers',
    onlyif  => '/bin/grep requiretty /etc/sudoers',
  }
}
