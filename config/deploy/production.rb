set :prod01, "rails@122.112.216.74"
set :prod02, "rails@47.88.24.28"

role :app, [ "#{fetch(:prod01)}", "#{fetch(:prod02)}" ]
role :web, [ "#{fetch(:prod01)}", "#{fetch(:prod02)}" ]
role :db,  [ "#{fetch(:prod01)}" ]

set :stage, :production
set :branch, :production
set :log_level, :debug

