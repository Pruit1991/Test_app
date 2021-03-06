# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)
# rubocop:disable Style/ClassAndModuleChildren
module TestApplication
  class Application < Rails::Application
    config.load_defaults 6.1
    config.active_record.schema_format = :sql
    config.generators.system_tests = nil
    config.active_job.queue_adapter = :sidekiq
  end
end
# rubocop:enable Style/ClassAndModuleChildren
