# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!
RSpec.describe UpdateOrderEmailWorker, type: :worker do
  describe 'when worker is working' do
    let(:order) { create(:order) }

    it 'responds to #perform' do
      expect(described_class.new).to respond_to(:perform)
    end

    it 'enqueues a updateorderemail worker' do
      expect do
        described_class.perform_async(order.id)
      end.to change(described_class.jobs, :size).by(1)
    end
  end
end
