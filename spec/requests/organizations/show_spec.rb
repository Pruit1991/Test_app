# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /organizations/:id', type: :request do
  let(:path) { "/organizations/#{organization.id}" }

  let(:user) { create(:user) }
  let(:organization) { create(:organization, user: user) }

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

  context 'when organization was already deleted' do
    it 'return error' do
      sign_in user
      get '/organizations/111'
      expect(response).to redirect_to(organizations_path)
    end
  end
end
