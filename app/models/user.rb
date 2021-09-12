# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :organizations, dependent: :destroy
  has_many :org_members, dependent: :destroy
end
