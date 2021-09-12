# frozen_string_literal: true

RSpec.describe Orders::Create do
  subject(:order) { described_class.new.(input) }

  context 'with successful creating order' do
    let(:first_name) { 'Alexey' }
    let(:patronymic) { 'Ivanovich' }
    let(:last_name) { 'Ivanov' }
    let(:phone_number) { '9379992' }
    let(:email) { 'example@gmail.com' }
    let(:weight) { 7 }
    let(:length) { 30 }
    let(:width) { 25 }
    let(:height) { 40 }
    let(:origin) { 'new york' }
    let(:destination) { 'los angeles' }
    let(:user) { create(:user) }
    let(:input) do
      { first_name: first_name, patronymic: patronymic,
        last_name: last_name, phone_number: phone_number, email: email,
        weight: weight, length: length, width: width, height: height,
        origin: origin, destination: destination, user: user }
    end

    it 'create valid order' do
      expect(order).to be_persisted
      expect(order).to be_a(Order)
    end
  end

  context 'with failure creating order' do
    let(:first_name) { 'Alexey' }
    let(:input) { { first_name: first_name } }

    it 'raise  not null violation error ' do
      expect { order }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
