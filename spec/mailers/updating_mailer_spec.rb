# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdatingMailer, type: :mailer do
  describe 'create email' do
    let(:mail) { described_class.update_email(order) }
    let(:order) { create(:order) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Order Updating')
      expect(mail.to).to eq([order.user.email])
      expect(mail.from).to eq(['notifications@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include('ORDER  STATUS UPDATED!')
    end
  end
end
