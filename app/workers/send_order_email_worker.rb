# frozen_string_literal: true

class SendOrderEmailWorker
  include Sidekiq::Worker

  def perform(order_id)
    order = Order.find(order_id)
    OrdersMailer.create_email(order).deliver_now
  end
end
