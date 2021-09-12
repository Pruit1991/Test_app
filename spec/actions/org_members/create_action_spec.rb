# frozen_string_literal: true

RSpec.describe OrgMembers::CreateAction do
  subject(:create_action) do
    service.(org_member_params)
  end

  let(:service) { described_class.new }

  let(:user) { create(:user) }
  let(:organization) { create(:organization) }

  context 'when valid params given' do
    let(:org_member_params) { { role: 'org_admin', user: user, organization: organization } }

    it 'create organization successfully' do
      org_member = create_action
      expect(org_member).to be_a(OrgMember)
      expect(org_member).to be_persisted
    end
  end
end
