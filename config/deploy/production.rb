set :stage, :production
set :rails_env, :production

set :deploy_to, "/home/sites/sites/#{fetch(:application)}/production"

role :app, %w{sites@box.rubyrockers.com}
role :web, %w{sites@box.rubyrockers.com}
role :db,  %w{sites@box.rubyrockers.com}
