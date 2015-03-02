define rbenv::install($version = $name) {
  require rbenv

  # Make sure rbenv is available in exec resources.
  Exec {
    user        => $rbenv::user,
    environment => "RBENV_ROOT=${rbenv::rbenv_root}",
    path        => [
      "${rbenv::rbenv_root}/bin",
      "${rbenv::rbenv_root}/shims",
      '/usr/sbin',
      '/usr/bin',
      '/sbin',
      '/bin'
    ],
  }

  exec { "install ruby ${version}":
    command => "rbenv install ${version}",
    creates => "${rbenv_root}/versions/${version}"
  }

  # Never, ever have I needed Ruby without bundler installed.
  exec { "install bundler for ruby ${version}":
    command     => "gem install bundler",
    creates     => "${rbenv_root}/versions/${version}/bin/bundle",
    environment => "RBENV_VERSION=${version}",
    require     => Exec["install ruby ${version}"]
  }
}
