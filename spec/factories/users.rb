# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "example#{i}@gmail.com" }
    password { '123456' }
  end
end
