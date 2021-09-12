# frozen_string_literal: true

RSpec.describe Orders::PriceCalculator do
  subject(:price) { service.(order) }

  let(:service) { described_class.new }

  context 'when price and distance calculates successfully!' do
    let(:order) { create(:order) }

    it 'calculates price and update Order' do
      expect { price }.to change(order, :price)
      expect(order.distance).not_to be_nil
    end
  end
end
