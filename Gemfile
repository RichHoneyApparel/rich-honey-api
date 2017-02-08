source 'https://rubygems.org'

gem 'rails', '4.0.0'                                  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sass-rails', '~> 4.0.0'                          # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                            # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'                        # Use CoffeeScript for .js.coffee assets and views
gem 'jquery-rails'                                    # Use jquery as the JavaScript library
gem 'active_model_serializers'                        # Serialize data that we're exposing
group :doc do
  gem 'sdoc', require: false                          # bundle exec rake doc:rails generates the API under doc/api.
end

group :development do
  gem 'pg'                                       # Use postgresql as the database for Active Record

  # Guard Gem
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload', group: :development
end

group :test do
  gem 'rspec-rails'                                   # Test suite for rails
  gem 'factory_girl_rails'                            # Test data generator
  gem 'ffaker'                                        # Mock data generator
  gem 'shoulda-matchers', '>= 3.0.0', require: false  # Test matchers
end

gem 'devise'
