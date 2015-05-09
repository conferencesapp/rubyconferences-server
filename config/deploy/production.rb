set :stage, :production
set :rails_env, :production
set :unicorn_rack_env, :production

set :deploy_to, "/home/sites/sites/#{fetch(:application)}/production"
set :unicorn_bundle, "source $HOME/.bash_profile && bundle"

role :app, %w{sites@box.rubyrockers.com}
role :web, %w{sites@box.rubyrockers.com}
role :db,  %w{sites@box.rubyrockers.com}
