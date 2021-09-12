# frozen_string_literal: true

class OrdersMailer < ApplicationMailer
  default from: 'notifications@example.com'
  helper_method :create_email
  def create_email(order)
    @order = order
    @user = order.user
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
