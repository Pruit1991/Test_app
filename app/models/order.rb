# frozen_string_literal: true

require 'aasm'
class Order < ApplicationRecord
  include AASM
  extend Enumerize
  enumerize :aasm_state, in: %i[created working completed], default: :created

  aasm do
    state :created, initial: true
    state :working
    state :completed

    event :prepare do
      transitions from: :created, to: :working
    end

    event :work do
      transitions from: :working, to: :completed
    end

    event :rest do
      transitions from: :completed, to: :created
    end
  end

  paginates_per 5
  belongs_to :user
end
