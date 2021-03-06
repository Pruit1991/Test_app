# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :user
  has_many :org_members, dependent: :destroy
  paginates_per 5
end
