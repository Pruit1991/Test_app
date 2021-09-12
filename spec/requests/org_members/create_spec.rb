# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /org_members', type: :request do
  let(:path) { '/org_members' }
  let(:user1) { create(:user) }
  let(:user) { create(:user, email: 'gunnerstewie@gmail.com') }
  let(:organization) { create(:organization, user: user) }
  let(:params) { { email: 'gunnerstewie@gmail.com', organization_id: organization.id, role: 'operator' } }

  context 'when valid params given' do
    it 'creates new org_member' do
      sign_in user1
      post path, params: params
      org_member = OrgMember.last

      expect(response).to have_http_status :found
      expect(response).to redirect_to(organizations_path)
      expect(org_member.user).to eq user
    end
  end

  context 'when invalid params given' do
    it 'with not logged in user' do
      post path, params: params
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when user to invite not found' do
    let(:params) { { email: 'missing@gmail.com', organization_id: organization.id, role: 'operator' } }

    it 'raise error and redirect back' do
      sign_in user
      post path, params: params
      expect(response).to redirect_to(organizations_path)
      expect(flash[:danger]).to match('User not found!')
    end
  end
end
