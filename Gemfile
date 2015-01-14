source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.rc1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.17.1'
# Use Bootstrap for styling
gem 'bootstrap-sass', '~> 3.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0'
# Use Uglifier as compressor for JavaScript assets
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
gem 'whenever', '~> 0.9.4'

# Better select forms:
gem 'selectize-rails', '~> 0.11.2'

# Nested forms
gem 'cocoon', '~> 1.2.6'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'faker', '~> 1.4.3'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard-minitest'
end

group :production do
  gem 'unicorn', '4.8.3'
  gem 'rails_12factor'
end
