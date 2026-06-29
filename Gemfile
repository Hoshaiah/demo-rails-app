source "https://rubygems.org"

# Ruby version pinned in .ruby-version (CI installs that exact version).
# No explicit `ruby` directive here so local bundle install works against any
# 3.1+ Ruby — handy when your laptop is on a different version than CI.

gem "rails", "~> 7.1.0"
gem "puma", ">= 5.0"
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end
