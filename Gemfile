source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'api-pagination'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'kaminari'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'rswag'
gem 'sqlite3'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
  gem 'shoulda-matchers', '~> 3.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
