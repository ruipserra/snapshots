source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'
gem 'uglifier', '>= 1.3.0'
gem 'vanilla-ujs'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'

  gem 'pry-rails'
  gem 'pry-byebug', platform: :mri

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :development do
  gem 'listen', '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
