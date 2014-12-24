class basebox {
  class { 'basebox::network':    } ->
  class { 'basebox::packages':   } ->
  class { 'basebox::services':   } ->
  class { 'basebox::users':      } ->
  class { 'basebox::sudo':       } ->
  class { 'basebox::virtualbox': }

  contain basebox::network
  contain basebox::packages
  contain basebox::services
  contain basebox::users
  contain basebox::sudo
  contain basebox::virtualbox
}
