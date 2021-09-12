# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrgMemberPolicy do
  subject { described_class.new(user, org_member) }

  let(:user) { create(:user) }
  let(:org_member) { create(:org_member) }

  context 'when poll_member is current user and admin' do
    let(:org_member) { create(:org_member, user: user) }

    it { is_expected.to permit_action(:show) }
  end

  context 'when current user is not member' do
    it { is_expected.to forbid_action(:show) }
  end

  context 'when org_member is not admin' do
    let(:org_member) { create(:org_member, :when_operator) }

    it { is_expected.to forbid_action(:show) }
  end
end
