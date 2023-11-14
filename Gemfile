source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem 'tailwindcss-rails', '~> 2.0', '>= 2.0.32'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.2', '>= 3.2.2'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.2'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
