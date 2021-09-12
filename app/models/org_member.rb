# frozen_string_literal: true

class OrgMember < ApplicationRecord
  extend Enumerize
  enumerize :role, in: %i[operator org_admin]
  belongs_to :user
  belongs_to :organization
end
