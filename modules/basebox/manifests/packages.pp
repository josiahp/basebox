class basebox::packages {

  $kernelversion = hiera('basebox::packages::kernelversion')

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
}
