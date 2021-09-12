# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /orders', type: :request do
  let(:path) { '/orders' }

  let(:user) { create(:user) }
  let(:params) do
    { order: {
      first_name: 'alexey123',
      patronymic: 'alexeevich',
      last_name: 'leskov',
      phone_number: '232323',
      email: 'example@gmail.com',
      weight: 20,
      length: 30,
      width: 100,
      height: 200,
      origin: 'new york',
      destination: 'los angeles',
      user: user
    } }
  end

  context 'when valid params given' do
    it 'creates new order' do
      sign_in user
      post path, params: params
      order = Order.last
      expect(response).to have_http_status :found
      expect(response).to redirect_to(order_path(order))
      expect(order.first_name).to eq('alexey123')
    end
  end

  context 'when invalid params given' do
    it 'with not logged in user' do
      post path, params: params
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when empty params given' do
    let(:params) do
      { order: { first_name: 'alexey123',
                 patronymic: 'alexeevich',
                 last_name: 'leskov',
                 phone_number: '232323' } }
    end

    it 'raise error and redirect back' do
      sign_in user
      post path, params: params
      expect(response).to redirect_to(orders_path)
      expect(flash[:danger]).to match('All rows must be filled!')
    end
  end
end
