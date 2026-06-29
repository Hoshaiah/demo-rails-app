class VersionController < ApplicationController
  def show
    render json: {
      app:   "demo-rails-app",
      rails: Rails::VERSION::STRING,
      ruby:  RUBY_VERSION,
    }
  end
end
