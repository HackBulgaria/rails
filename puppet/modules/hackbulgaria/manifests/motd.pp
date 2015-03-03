class hackbulgaria::motd {
  file { '/etc/motd':
    source => 'puppet:///modules/hackbulgaria/motd'
  }
}
