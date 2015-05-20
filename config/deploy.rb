lock '3.4.0'

set :application, 'rubyconferences'
set :repo_url, 'git@github.com:raysrashmi/rubyconferences-server.git'
set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :deploy_via, :remote_cache
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :linked_files, %w{ config/database.yml .env }
set :linked_dirs, %w{ log tmp/pids tmp/cache tmp/sockets vendor/bundle }

set :ssh_options, forward_agent: true
set :pty, true

set :rvm_type, :user
set :rvm_ruby_version, "2.2.2"


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
