source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# bootstrap
gem 'bootstrap', '~>4.1.1'
gem 'jquery-rails'

# ジャケット画像投稿用
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"

# ログイン機能
gem 'devise'

# ページング機能
gem 'kaminari'
gem 'kaminari-bootstrap'

# 検索機能用
# これ使うかまだ確定ではない
gem 'ransack'

# クレジットカード決済システム
gem 'payjp'

# font-awesome用
gem 'font-awesome-rails'

# 初期データ投入用
gem 'seed-fu', '~> 2.3'

# メールの送信確認　どっちかあればいい
# gem 'letter-opener'
# gem 'mailcatcher'


# 以下は未定
# gem 'font-awesome-rails'
# gem 'rails-i18n'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  # 以下未定
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'hirb'
  gem 'hirb-unicode'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
