source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'appdev_support'
gem 'awesome_print'
gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.1.3'
gem 'devise'
gem 'dotenv-rails'
gem 'faker'
gem 'htmlbeautifier'
gem 'http'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'pg', '~> 1.1'
gem 'puma'
gem 'pundit'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'table_print'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'draft_generators'
  gem 'grade_runner'
  gem 'pry-rails'
  gem 'rails_db'
  gem 'rails-erd'
  gem 'rubocop', require: false
  gem 'rufo'
  gem 'specs_to_readme'
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
end

group :test do
  gem 'capybara'
  gem 'draft_matchers'
  gem 'rspec-html-matchers'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'webmock'
end
