# frozen_string_literal: true

FactoryBot.define do
  factory :org_member do
    user
    organization
    role { 'org_admin' }

    trait :when_operator do
      role { 'operator' }
    end
  end
end
