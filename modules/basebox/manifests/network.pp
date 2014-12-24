class basebox::network {
  if $::osfamily == "RedHat" {
    file { '/etc/udev/rules.d/70-persistent-net.rules':
      ensure => symlink,
      target => '/dev/null',
    }
    exec { 'set interfaces to start on boot':
      command => '/bin/sed -i"" "s/ONBOOT=.*/ONBOOT=yes/" /etc/sysconfig/network-scripts/ifcfg-*',
    }
  }
}
