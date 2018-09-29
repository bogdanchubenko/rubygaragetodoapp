require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module ToDoLists
  class Application < Rails::Application
    config.assets.precompile += %w[*.png *.jpg *.jpeg *.gif]
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
