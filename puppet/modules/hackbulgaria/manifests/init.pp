class hackbulgaria {
  include hackbulgaria::auth

  File {
    owner   => 'hack',
    group   => 'hack',
    require => User['hack']
  }

  # Make sure bash is installed. We want it as administrator's shell.
  package { 'bash': }

  # Use the hack user for deploy and applications run.
  user { 'hack':
    ensure      => present,
    home        => '/home/hack',
    managehome  => true,
    shell       => '/bin/bash',
    require     => Package['bash']
  }

  # Make sure to create the user directory. Stuff like rbenv installation and
  # administrator friendly .bashrc files go here.
  file {
    '/home/hack':
      ensure  => 'directory';

    '/home/hack/.bashrc':
      source => 'puppet:///modules/hackbulgaria/bashrc';

    '/home/hack/.aliases':
      source => 'puppet:///modules/hackbulgaria/aliases';
  }

  # Use this directory to serve the apps from and leave the home for homey
  # stuff.
  file { '/hack':
    ensure  => 'directory'
  }
}
