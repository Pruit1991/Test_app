# frozen_string_literal: true

# Allows to automatically inject dependencies to object constructors from a
# configured container.
# http://dry-rb.org/gems/dry-auto_inject/
module AutoInjectServices
  extend Dry::Container::Mixin

  def self.extended(container)
    container.instance_exec do
      namespace :services do
        register(:validate_input) { ValidateInput.new }

        namespace :orders do
          register(:create) { Orders::Create.new }
          register(:price_calculator) { Orders::PriceCalculator.new }
        end
      end
    end
  end
end
