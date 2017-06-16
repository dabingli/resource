# config valid only for current version of Capistrano
lock '3.8.0'

set :application, 'resource-center'
set :repo_url, 'ssh://git@gitlab.fslola.cn:8011/it/resource-center.git'

set :deploy_to, '/rails_apps/resource-center'

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/application.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/cache', 'node_modules', 'public/fonts'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# rbenv
set :rbenv_ruby, File.read('.ruby-version').strip

# seed-fu
require 'seed-fu/capistrano3'
before 'deploy:publishing', 'db:seed_fu'
