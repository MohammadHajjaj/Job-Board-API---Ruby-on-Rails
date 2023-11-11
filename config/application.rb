require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module YourAppName
  class Application < Rails::Application
    config.load_defaults 7.0
    # Add any additional configuration here
  end
end
