# The static content website for the Ruby on Rails class.
#
# Take a note that this isn't a generic Rails application config or
# anything like that.
class rails($user) {
  File {
    owner => $user,
    group => $user
  }

  # Create the directory structure Capistrano expects, so we don't have to run
  # deploy:setup for each new machine. Now, we probably won't have another one,
  # but hey, set the example, right?
  ensure_resource(file, '/hack',                     { ensure => 'directory' })
  ensure_resource(file, '/hack/rails',               { ensure => 'directory' })
  ensure_resource(file, '/hack/rails',               { ensure => 'directory' })
  ensure_resource(file, '/hack/rails/releases',      { ensure => 'directory' })
  ensure_resource(file, '/hack/rails/shared',        { ensure => 'directory' })
  ensure_resource(file, '/hack/rails/shared/system', { ensure => 'directory' })
  ensure_resource(file, '/hack/rails/shared/log',    { ensure => 'directory' })
  ensure_resource(file, '/hack/rails/shared/pids',   { ensure => 'directory' })

  # This will make sure the /hack/rails/current link exists, but if it doesn't
  # it will point it to /usr/share/nginx/html, so nginx can still boot.
  softlink { '/hack/rails/current':
    fallback => '/usr/share/nginx/html'
  }
}
