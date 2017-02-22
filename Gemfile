source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.1"

gem "pg", "~> 0.18"

gem "puma", "~> 3.0"

# Assets
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "sass-rails", "~> 5.0"
gem "sprockets-commoner"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

# Json generation
gem "jbuilder", "~> 2.5"

group :development, :test do
  # Code analysis
  gem "rails_best_practices"
  gem "rubocop-github"

  # Debuggging
  gem "awesome_print"
  gem "pry"
  gem "pry-nav"

  # Testing
  gem "capybara"
  gem "fuubar"
  gem "rspec-rails"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
