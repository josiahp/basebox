class basebox {
  class { 'basebox::packages': } ->
  class { 'basebox::virtualbox': }

  contain basebox::packages
  contain basebox::virtualbox
}
