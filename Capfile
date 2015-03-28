load "deploy"

default_run_options[:pty] = true

# As long as we don't push all the cat photos in this repo, we can be good. I
# like how I can slash and dice repos around with the copy strategy.
set :scm, :none
set :scm_verbose, true

set :deploy_via, :copy
set :copy_exclude, ".vagrant/*"

set :public_children, []

set :keep_releases, 5

task :site do
  set :application, "rails"

  set :user, "hack"
  set :use_sudo, false

  set :repository, "./_site"
  set :deploy_to, "/hack/#{application}"

  before "deploy:update_code" do
    run_locally "bundle exec jekyll build"
  end

  server ENV.fetch("server", "188.226.232.4"), :app, primary: true
end

task :provision do
  set :application, "puppet"

  set :user, "root"
  set :use_sudo, false

  set :repository, "puppet"
  set :deploy_to, "/#{user}/provision"

  server ENV.fetch("server", "188.226.232.4"), :app, primary: true

  before "deploy:update_code" do
    run_locally "librarian-puppet install --verbose"
  end

  # Since I wanna be sure I have the right puppet versions all around, I
  # bootstrap them before every Puppet deploy. This also solves the chiken-egg
  # problem the very first time this repo is deployed.
  after "deploy:update_code" do
    run "#{release_path}/bootstrap.sh"
  end

  after "deploy:create_symlink" do
    run [
      "puppet apply  #{current_path}/manifests/default.pp",
      "--manifestdir #{current_path}/manifests",
      "--modulepath  #{current_path}/modules:#{current_path}/vendor",
      "--verbose"
    ].join(" ")
  end
end

namespace :deploy do
  task :finalize_update do
    # In a Rails deploy, this would create symlinks to the shared directory for
    # log, system, tmp and pids directories. We don't need those.
  end
end
