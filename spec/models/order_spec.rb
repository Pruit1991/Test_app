# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:user) }

  describe 'aasm testing' do
    subject { instance }

    let(:instance) { described_class.new }

    it { is_expected.to have_state(:created) }
    it { is_expected.to transition_from(:created).to(:working).on_event(:prepare) }
    it { is_expected.to allow_event :prepare }
    it { is_expected.not_to allow_event :work }
    it { is_expected.not_to transition_from(:created).to(:completed).on_event(:prepare) }
  end

  describe 'enumerize testing' do
    it { is_expected.to enumerize(:aasm_state).in(:created, :working, :completed).with_default(:created) }
  end
end
