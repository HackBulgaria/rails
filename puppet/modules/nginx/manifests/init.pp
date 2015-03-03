class nginx(
  $server_name = $::hostname,
  $site_name   = 'app',
  $www_root    = '/usr/share/nginx/html/'
) {
  # Let each file in the current scope depend on the nginx package and restart
  # its service.
  File {
    require => Package['nginx'],
    notify  => Service['nginx']
  }

  # Add a PPA for the stable release and install the latest package.
  apt::ppa { 'ppa:nginx/stable': } -> package { 'nginx': ensure => latest }

  file {
    # Disable the default site.
    '/etc/nginx/sites-enabled/default':
      ensure => absent;

    # Enable the custom site.
    "/etc/nginx/sites-enabled/${site_name}":
      ensure => link,
      target => "/etc/nginx/sites-available/${site_name}";

    "/etc/nginx/sites-available/${site_name}":
      content => template('nginx/site.conf.erb')
  }

  # Start nginx right now and also on boot.
  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx']
  }
}
