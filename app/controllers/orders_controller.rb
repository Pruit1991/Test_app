# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  include DI[
    create_order: 'actions.orders.create'
  ]

  helper_method :sort_column, :sort_direction

  def index
    @orders = Order.order("#{sort_column} #{sort_direction}").page(params[:page]).where(user_id: current_user.id)
  end

  def new
    @order = Order.new
  end

  def create
    @order = create_order.(order_params.merge(user: current_user))
    flash[:success] = 'Order created successfully!'
    redirect_to order_path(@order)
  rescue ActiveRecord::NotNullViolation
    flash[:danger] = 'All rows must be filled!'
    redirect_back fallback_location: orders_path
  end

  def show
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Order is missing!'
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :patronymic, :phone_number, :email, :weight, :length,
      :width, :height, :origin, :destination)
  end

  def sort_column
    Order.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
