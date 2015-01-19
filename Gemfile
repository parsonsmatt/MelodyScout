source 'https://rubygems.org'

ruby "2.2.0"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.17.1'
# Use Bootstrap for styling
gem 'twitter-bootstrap-rails', '~> 3.2.0'
gem 'bootstrap-sass', '~> 3.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0'
gem 'autoprefixer-rails'
#Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# paginationnn
gem 'will_paginate', '~> 3.0.7'
gem 'bootstrap-will_paginate', '~> 0.0.10'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Scheduled tasks:
gem 'whenever', '~> 0.9.4', require: false

# Better select forms:
gem 'selectize-rails', '~> 0.11.2'

# Nested forms
gem 'cocoon', '~> 1.2.6'

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma', require: false
end

group :development, :test do
  gem 'byebug'
  gem 'faker', '~> 1.4.3'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard-minitest'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
  gem 'rack-cache'
end
