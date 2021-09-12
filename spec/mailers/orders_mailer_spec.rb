# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersMailer, type: :mailer do
  describe 'create email' do
    let(:mail) { described_class.create_email(order) }
    let(:order) { create(:order) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to My Awesome Site')
      expect(mail.to).to eq([order.user.email])
      expect(mail.from).to eq(['notifications@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include('You have successfully created order on example.com')
    end
  end
end
