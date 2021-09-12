# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /organizations', type: :request do
  let(:path) { '/organizations' }

  let(:user) { create(:user) }
  let(:params) { { organization: { title: 'new organization', user: user } } }

  context 'when valid params given' do
    it 'creates new order' do
      sign_in user
      post path, params: params
      organization = Organization.last
      expect(response).to have_http_status :found
      expect(response).to redirect_to(organization_path(organization))
      expect(organization.title).to eq('new organization')
    end
  end

  context 'when invalid params given' do
    it 'with not logged in user' do
      post path, params: params
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
