# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
  end
  rescue_from Pundit::NotAuthorizedError, with: :org_member_not_admin

  private

  def org_member_not_admin
    flash[:success] = 'Operators can see only their own orders'
    redirect_to(orders_path)
  end
end
