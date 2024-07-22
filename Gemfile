source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "appdev_support"
gem "awesome_print"
gem "bootsnap", require: false
gem "devise"
gem "dotenv-rails"
gem "faker"
gem "htmlbeautifier"
gem "http"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "stimulus-rails"
gem "table_print"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]


# Use Sass to process CSS
# gem "sassc-rails"
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0.0"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "draft_generators"
  gem "grade_runner"
  gem "pry-rails"
  gem "rails_db"
  gem "rails-erd"
  gem "rufo"
  gem "specs_to_readme"
  gem "web-console"
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
end

group :test do
  gem "capybara"
  gem "draft_matchers"
  gem "rspec-html-matchers"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "webmock"
end
