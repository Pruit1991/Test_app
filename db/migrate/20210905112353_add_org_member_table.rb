# frozen_string_literal: true

class AddOrgMemberTable < ActiveRecord::Migration[6.1]
  def change
    create_table :org_members do |t|
      t.string :role, null: false
      t.references :user, null: false, foreign_key: true, index: true
      t.references :organization, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
