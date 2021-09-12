# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /organizations/new', type: :request do
  let(:path) { '/organizations/new' }

  let(:user) { create(:user) }

  context 'when user is logged in' do
    it 'redirects to new organization page' do
      sign_in user
      get path
      expect(response).to have_http_status :success
      expect(response).to render_template('new')
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
