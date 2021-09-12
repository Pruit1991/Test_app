# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:org_members) }
end
