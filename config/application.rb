require_relative "boot"

# API-only Rails app: skip ActiveRecord, ActionMailer, ActionCable, asset
# pipeline, JS. Keeps the demo tight and the test runtime fast.
require "rails"
require "action_controller/railtie"

Bundler.require(*Rails.groups)

module DemoRailsApp
  class Application < Rails::Application
    config.load_defaults 7.1
    config.api_only = true
  end
end
