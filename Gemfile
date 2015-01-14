source 'http://rubygems.org'
#ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
gem 'bootstrap-sass', '3.2.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.1.1'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.1'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.1.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.2.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.1.3'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :test do
	# 2014-09-10 ksw...these were in the test group in the 2nd ed.
	#gem 'selenium-webdriver', '2.35.1'
	#gem 'capybara', '2.1.0'
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :development, :test do 
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.9'
  # 2014-09-10 ksw...this was in the development group in the 2nd ed.
  #gem 'rspec-rails', '2.13.1'
  gem 'spring', '1.1.3'
end

group :production do
	# include PostgreSQL
	gem 'pg', '0.17.1'
	gem 'rails_12factor', '0.0.2'
  # Use unicorn as the app server
  gem 'unicorn',  '4.8.3'
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use faker to create dummy data/users
gem 'faker',  '1.4.3'

gem 'will_paginate', '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]
