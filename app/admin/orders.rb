# frozen_string_literal: true

ActiveAdmin.register Order do
  config.per_page = 10

  permit_params do
    permitted = %i[first_name last_name patronymic
                   phone_number email weight length width height
                   origin destination aasm_state]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  index do
    selectable_column
    column :first_name
    column :last_name
    column :patronymic
    column :phone_number
    column :email
    column :weight
    column :length
    column :width
    column :height
    column :origin
    column :destination
    column :distance
    column :price
    column :order_number
    column :user
    state_column :aasm_state, interactive: true
    actions
  end

  controller do
    def update
      order = resource
      order.assign_attributes(permitted_params[:order])

      UpdateOrderEmailWorker.perform_async(order.id) if order.aasm_state_changed? && order.valid?
      order.save
      flash[:success] = 'Order updated!'
      render :show
    end
  end
end
