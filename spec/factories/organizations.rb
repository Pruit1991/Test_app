# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    user
    title { 'Microsoft' }
  end
end
