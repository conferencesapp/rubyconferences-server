set :stage, :staging
set :rails_env, :staging

set :deploy_to, "/home/sites/sites/#{fetch(:application)}/staging"

role :app, %w{sites@box.rubyrockers.com}
role :web, %w{sites@box.rubyrockers.com}
role :db,  %w{sites@box.rubyrockers.com}
