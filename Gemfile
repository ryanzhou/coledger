source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'sprockets', '2.12.3'  # Do not upgrade to 3.0 until angular-rails-templates supports it

# Use jquery as the JavaScript library
# gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'mongoid'
gem 'active_model_serializers'
gem 'angular-rails-templates', '0.1.3'
gem 'money-rails'
gem "mongoid-enum"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'tzinfo-data'
  gem 'faker'
end

group :production do
  gem 'rails_12factor'
end

# Install bower components here. See https://rails-assets.org
source 'http://rails-assets.org' do
  gem 'rails-assets-bootswatch'
  gem 'rails-assets-fontawesome'
  gem 'rails-assets-angular', '1.3.15'
  gem 'rails-assets-angular-ui-router'
  gem 'rails-assets-angular-resource'
  gem 'rails-assets-angular-flash'
  gem 'rails-assets-angular-bootstrap'
  gem 'rails-assets-angular-schema-form'
  gem 'rails-assets-angular-xeditable', '0.1.8'
  gem 'rails-assets-ngDraggable', '0.1.4'
  gem 'rails-assets-jquery-flipster'
  gem 'rails-assets-angular-moment'
  gem 'rails-assets-pickadate', '3.5.6'
  gem 'rails-assets-imagesloaded'
  gem 'rails-assets-angular-chart.js'
  gem 'rails-assets-angular-scroll'
end

# For Heroku
ruby "2.1.5"
