source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.1'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'httparty'
gem 'jsonapi-serializer'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rswag-api'
gem 'rswag-ui'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.2'
  gem 'rswag-specs'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
