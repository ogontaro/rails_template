require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTemplate
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end

  config.generators do |g|
    g.stylesheets false
    g.javascripts false
    g.helper false
    g.decorator false
    g.orm :active_record, migration: false
    g.template_engine :slim
    g.test_framework :rspec,
                     view_specs: false,
                     helper_specs: false,
                     controller_specs: false,
                     routing_specs: false,
                     fixture: true,
                     fixture_replacement: :factory_girl, dir: 'spec/factories'
  end
end
