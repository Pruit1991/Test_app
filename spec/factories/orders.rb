# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    sequence(:first_name) { |i| "Alexey#{i}" }
    sequence(:last_name) { |i| "Ivanov#{i}" }
    sequence(:patronymic) { |i| "Ivanovich#{i}" }
    phone_number { '937-99-92' }
    sequence(:email) { |i| "user-#{i}@example.com" }
    weight { 7 }
    length { 120 }
    width { 200 }
    height { 300 }
    origin { 'new york' }
    destination { 'los angeles' }
    user
  end
end
