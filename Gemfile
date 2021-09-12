# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'aasm', '~> 5.2.0'
gem 'activeadmin', '~> 2.9.0'
gem 'activeadmin_addons', '~> 1.8.3'
gem 'addressable'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap-sass', '~> 3.4.1'
gem 'carrierwave', '~> 2.0'
gem 'devise', '~> 4.8.0'
gem 'dotenv-rails', '~> 2.7.6'
gem 'dry-auto_inject', '~> 0.6'
gem 'dry-validation', '~> 1.6.0'
gem 'enumerize', '~> 2.4.0'
gem 'erb2haml', group: :development
gem 'haml', '~> 5.2.2'
gem 'httparty', '~> 0.18.1'
gem 'jbuilder', '~> 2.7'
gem 'mini_magick', '~> 4.11.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.1.1'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'redis-namespace', '~> 1.8.1'
gem 'sass-rails', '>= 6'
gem 'sidekiq', '~> 6.1', '>= 6.1.3'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.4.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'simplecov', '~> 0.21.2', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.18.3', require: false
  gem 'rubocop-performance', '~> 1.5', '>= 1.5.2', require: false
  gem 'rubocop-rails', '~> 2.2', require: false
  gem 'rubocop-rspec', '~> 2.0', require: false
  gem 'spring', '~> 2.1.1'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0.1'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'pundit-matchers', '~> 1.7.0'
  gem 'rails-controller-testing', '~> 1.0.5'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'shoulda-matchers', '~> 4.5.1'
  gem 'webmock', '~> 3.13.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
