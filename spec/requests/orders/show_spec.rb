# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /orders/:id', type: :request do
  let(:path) { "/orders/#{order.id}" }

  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }

  context 'when user is logged in' do
    it 'returns order' do
      sign_in user
      get path
      expect(response).to have_http_status :success
      expect(response).to render_template('show')
    end
  end

  context 'when user is not logged in' do
    it 'redirect to login path' do
      get path
      expect(response).to have_http_status :found
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when order was already deleted' do
    it 'return error' do
      sign_in user
      get '/orders/111'
      expect(response).to redirect_to(orders_path)
    end
  end
end
