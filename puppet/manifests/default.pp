node default {
  require hackbulgaria

  class { 'rbenv':
    user    => 'hack',
    require => Class['hackbulgaria']
  }

  rbenv::install { '2.2.0': }
}
