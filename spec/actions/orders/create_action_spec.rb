# frozen_string_literal: true

RSpec.describe Orders::CreateAction do
  subject(:create_action) do
    service.(order_params)
  end

  let(:service) do
    described_class.new(
      create: create,
      price_calculator: price_calculator
    )
  end

  let(:create) { instance_double(Orders::Create, call: order) }
  let(:price_calculator) { instance_double(Orders::PriceCalculator, call: order) }
  let(:user) { build(:user) }

  context 'with successful action call' do
    let(:create) { instance_double(Orders::Create, call: order) }
    let(:price_calculator) { instance_double(Orders::PriceCalculator, call: order) }
    let(:order) { build_stubbed(:order) }
    let(:order_params) { {} }

    it 'call successful' do
      create_action

      expect(create).to have_received(:call).with(order_params)
      expect(price_calculator).to have_received(:call).with(order)
    end
  end

  context 'with concrete params given' do
    let(:service) { described_class.new }
    let(:order_params) do
      { first_name: 'alexey', patronymic: 'alexeevich', last_name: 'leskov', phone_number: '9379992',
        email: 'example@gmail.com', weight: 20, length: 30, width: 100, height: 200, origin: 'new york',
        destination: 'los angeles', user: user }
    end

    it 'successfull action calling' do
      order = create_action
      expect(order).to be_a(Order)
      expect(order).to be_persisted
    end
  end
end
