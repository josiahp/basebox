class basebox::packages {

  $kernelversion = hiera('basebox::packages::kernelversion')

  # Guest Additions Tools

  package { 'bzip2':
    ensure        => installed,
    allow_virtual => false,
  } ->
  package { 'kernel-devel':
    ensure        => $kernelversion,
    allow_virtual => false,
  }
  
  # Provisioning Tools

  package { 'gcc':
    ensure        => latest,
    allow_virtual => false,
  } ->
  package { 'ruby-devel':
    ensure        => latest,
    allow_virtual => false,
  } ->
  package { 'puppet':
    ensure   => latest,
    provider => 'gem',
  } ->
  package { 'chef':
    ensure   => latest,
    provider => 'gem',
  }
  package { 'libshadow':
    ensure   => latest,
    provider => 'gem',
  }

  # Vagrant Tools
  package { 'openssh-server':
    ensure        => latest,
    allow_virtual => false,
  }

}
