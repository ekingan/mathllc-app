source 'https://rubygems.org'
ruby '3.0.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 6.1.4.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'

gem 'activeadmin'
gem 'webpacker'
gem 'react-rails'

gem 'devise'
gem 'cancan' # or cancancan
gem 'draper'
gem 'pundit'
gem 'active_skin'
gem 'coffee-rails', '~> 5.0.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rb-readline'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
