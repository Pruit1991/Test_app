# frozen_string_literal: true

class Orders::CreateAction
  include DI[
    'services.orders.create',
    'services.orders.price_calculator'
  ]

  def call(order_params)
    create.(order_params).tap do |order|
      price_calculator.(order)
      SendOrderEmailWorker.perform_async(order.id)
    end
  end
end
