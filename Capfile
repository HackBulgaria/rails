load "deploy"

task :site do
  set :application, "rails"

  set :user, "hack"
  set :use_sudo, false

  default_run_options[:pty] = true

  set :repository, "./_site"

  set :deploy_via, :copy
  set :deploy_to, "/hack/#{application}"

  set :scm, :none
  set :scm_verbose, true

  set :copy_exclude, ".vagrant/*"
  set :build_script, "jekyll build"

  set :public_children, []

  server ENV.fetch("server", "188.226.232.4"), :app, primary: true
end

namespace :deploy do
  task :finalize_update do
    # In a Rails deploy, this would create symlinks to the shared directory for
    # log, system, tmp and pids directories. We don't need those.
  end
end
