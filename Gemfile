# A sample Gemfile
source "https://rubygems.org"

gem 'rake'
gem 'activesupport'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'
gem "activerecord", "~> 4.2.5"

gem 'rack-flash3'

gem 'puma'
gem 'tux'

gem 'bcrypt', '3.1.7'

gem 'pg'

# These gems are only installed when run as `bundle install --without production`
group :development, :test do
  gem 'pry'
  gem 'shotgun'
  gem 'sqlite3'
end

# bundle install --without test --without development
group :production do
  # use postgres in production, or move outside a group if your app uses postgres for development and production 
end
