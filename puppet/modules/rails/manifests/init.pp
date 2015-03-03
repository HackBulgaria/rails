# The static content website for the Ruby on Rails class.
#
# Take a note that this isn't a generic Rails application config or
# anything like that.
class rails($user) {
  File {
    owner => $user,
    group => $user
  }

  ensure_resource(file, '/hack',       { ensure => 'directory' })
  ensure_resource(file, '/hack/rails', { ensure => 'directory' })
}
