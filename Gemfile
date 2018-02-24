# frozen_string_literal: true

ruby '2.5.0'

source 'https://rubygems.org'

gem 'rails', '~> 5.1.2'

gem 'pg', '~> 0.18'

gem 'puma', '~> 3.7'

# Assets
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'summernote-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Authentication
gem 'clearance'

# Json generation
gem 'jbuilder', '~> 2.5'

# Faker used to seed data (require false)
gem 'faker', require: false

# Slug generation
gem 'friendly_id'

# Background processing
gem 'sidekiq'

# Api Wrappers
gem 'slack-notifier' # Send notifications to slack channels

# Monitoring and error tracking
gem 'bugsnag'
gem 'newrelic_rpm'
gem 'rollbar'

group :development, :test do
  # Code analysis
  gem 'brakeman'
  gem 'rails_best_practices'
  gem 'rubocop'

  # Debuggging
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-nav'

  # Testing
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'fuubar'
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  # environment variables
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'rack-mini-profiler'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
