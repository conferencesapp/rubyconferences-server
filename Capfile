require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/rvm"
require "capistrano/bundler"
require "capistrano/puma"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require "capistrano/deploytags"

Dir.glob("lib/capistrano/tasks/*.cap").each { |r| import r }
