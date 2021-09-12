# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrgMember, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:organization) }

  describe 'enumerize testing' do
    it { is_expected.to enumerize(:role).in(:operator, :org_admin) }
  end
end
