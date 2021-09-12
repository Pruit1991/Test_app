# frozen_string_literal: true

class UpdateOrderEmailWorker
  include Sidekiq::Worker

  def perform(order_id)
    order = Order.find(order_id)
    UpdatingMailer.update_email(order).deliver_now
  end
end
