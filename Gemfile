source 'https://gems.ruby-china.org'
#source 'https://rubygems.org'

ruby '>= 2.3.1'

# Search
gem 'rails-simple-search', '1.1.2'
# Pagination
gem 'will_paginate', '~> 3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt'

# redis
gem 'hiredis', '~> 0.6'
gem 'redis', '~> 3.3'
gem 'redis-namespace', '~> 1.5'

# Use Unicorn as the app server
# gem 'unicorn'

gem 'rest-client', '~> 2.0.0'

# Image uploader
gem 'carrierwave', '~> 1.0.0'
gem 'carrierwave-qiniu', '~> 1.1.0'

gem 'annotate'
gem 'figaro'
gem 'mini_magick'
gem 'seed-fu', '~> 2.3'

gem 'rails-i18n', '~> 4.0.0'

gem 'easy_swagger_ui', '~> 0.1.0'

# CORS
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'rubocop', '~> 0.47.1', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'guard-livereload', '~> 2.5.2'
  gem 'rack-livereload', '~> 0.3.16'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # turns off Rails asset pipeline log.
  gem 'quiet_assets', '~> 1.1'

  # Deployment
  gem 'capistrano-passenger', '~> 0.2', require: false
  gem 'capistrano-rails', '~> 1.2', require: false
  gem 'capistrano-rbenv', '~> 2.1', require: false
  gem 'capistrano-yarn', '~> 2.0', require: false
end
