# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:organizations) }
  it { is_expected.to have_many(:org_members) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
end
