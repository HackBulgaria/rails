class rbenv::packages {
  case $osfamily {
    'Debian': {
      package {
        [
          'git',
          'autoconf',
          'bison',
          'build-essential',
          'libssl-dev',
          'libyaml-dev',
          'libreadline6-dev',
          'zlib1g-dev',
          'libncurses5-dev',
          'libffi-dev',
          'libgdbm3',
          'libgdbm-dev',
        ]:
      }
    }
  }
}
