node default {
  require hackbulgaria
  include apt

  class { 'rbenv':
    user    => 'hack',
    require => Class['hackbulgaria']
  }

  rbenv::install { '2.2.0': }

  class { 'rails':
    user => 'hack'
  }

  class { 'nginx':
    server_name => 'rails',
    www_root    => '/hack/rails',
    require     => Class['rails']
  }

  exec { '/usr/bin/apt-get update':
    before => Class['apt']
  }
}
