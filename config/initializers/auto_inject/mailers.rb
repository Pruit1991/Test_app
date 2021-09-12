# frozen_string_literal: true

module AutoInjectMailers
  extend Dry::Container::Mixin

  def self.extended(container)
    container.instance_exec do
      namespace :mailers do
        namespace :orders do
          register(:order_mailer) { Orders::OrderMailer.new }
        end
      end
    end
  end
end
