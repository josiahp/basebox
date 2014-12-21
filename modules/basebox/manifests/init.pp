class basebox {
  class { 'basebox::packages': }

  contain basebox::packages
}
