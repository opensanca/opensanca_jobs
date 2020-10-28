# frozen_string_literal: true

ruby '2.7.2'

source 'https://rubygems.org'

gem 'bootsnap'
gem 'rails', '~> 5.2.1'

gem 'pg', '~> 0.18'

gem 'puma', '~> 3.7'

# Assets
gem 'font-awesome-sass', '~> 4.7.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'summernote-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 3.5'

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
gem 'skylight'

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
  gem 'chromedriver-helper'
  gem 'factory_girl_rails'
  gem 'fuubar'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'terminal-notifier-guard'

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
