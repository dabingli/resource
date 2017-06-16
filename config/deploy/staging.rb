set :target_access, "rails@122.112.212.194"

role :app, [ "#{fetch(:target_access)}" ]
role :web, [ "#{fetch(:target_access)}" ]
role :db,  [ "#{fetch(:target_access)}" ]

set :stage, :staging
set :branch, :staging
set :log_level, :debug
