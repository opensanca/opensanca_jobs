ruby '2.4.0'

source 'https://rubygems.org'

gem 'rails', '~> 5.1.0.rc1'

gem 'pg', '~> 0.18'

gem 'puma', '~> 3.7'

# Assets
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'sass-rails', github: 'rails/sass-rails'
gem 'sprockets-commoner'
gem 'summernote-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

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

group :development, :test do
  # Code analysis
  gem 'brakeman'
  gem 'rails_best_practices'
  gem 'rubocop-github'

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
