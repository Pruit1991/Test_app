# frozen_string_literal: true

class Orders::Create
  def call(order_params)
    Order.create!(order_params)
  end
end
