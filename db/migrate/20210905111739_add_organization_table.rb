# frozen_string_literal: true

class AddOrganizationTable < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
