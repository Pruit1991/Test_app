# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /organizations', type: :request do
  let(:path) { '/organizations' }

  let(:user) { create(:user) }
  let(:order) { create(:organization, user: user) }

  context 'when user is logged in' do
    it 'returns order' do
      sign_in user
      get path
      expect(response).to have_http_status :success
      expect(response).to render_template('index')
    end
  end

  context 'when user is not logged in' do
    it 'redirect to login path' do
      get path
      expect(response).to have_http_status :found
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
