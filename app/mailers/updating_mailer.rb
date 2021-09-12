# frozen_string_literal: true

class UpdatingMailer < ApplicationMailer
  default from: 'notifications@example.com'
  helper_method :update_email
  def update_email(order)
    @order = order
    @user = order.user
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Order Updating')
  end
end
