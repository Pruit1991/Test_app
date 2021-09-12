# frozen_string_literal: true

RSpec.describe Organizations::CreateAction do
  subject(:create_action) do
    service.(organization_params)
  end

  let(:service) { described_class.new }

  let(:user) { build(:user) }

  context 'when valid params given' do
    let(:organization_params) { { title: 'title', user: user } }

    it 'create organization successfully' do
      organization = create_action
      expect(organization).to be_a(Organization)
      expect(organization).to be_persisted
    end
  end
end
