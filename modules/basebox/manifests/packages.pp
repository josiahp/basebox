class basebox::packages {
  package { 'kernel-devel':
    ensure        => latest,
    allow_virtual => false,
  }
  
  package { 'puppet':
    ensure   => latest,
    provider => 'gem',
  }
}
