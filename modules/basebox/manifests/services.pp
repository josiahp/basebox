class basebox::services {
  service { 'sshd':
    ensure => running,
    enable => true,
  }

  service { 'iptables':
    ensure => stopped,
    enable => false,
  }
}
