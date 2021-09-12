# frozen_string_literal: true

require_relative 'auto_inject/actions'
require_relative 'auto_inject/services'

class DryContainer
  extend Dry::Container::Mixin

  extend AutoInjectActions
  extend AutoInjectServices
end

DI = Dry::AutoInject(DryContainer)
