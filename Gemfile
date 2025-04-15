# frozen_string_literal: true

source 'https://rubygems.org'

gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'propshaft'
gem 'puma', '>= 5.0'
gem 'rails', '~> 8.0.2'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'devise', '~> 4.9'

gem 'slim-rails'

gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

gem 'sentry-rails'
gem 'sentry-ruby'

gem 'bootsnap', require: false
gem 'kamal', require: false
gem 'thruster', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  gem 'brakeman', require: false

  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false

  gem 'slim_lint', require: false

  gem 'sqlite3', '>= 2.1'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'minitest-power_assert'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
end
