# frozen_string_literal: true

class AddOrdersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :patronymic, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.integer :weight, null: false
      t.integer :length, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.string :origin, null: false
      t.string :destination, null: false
      t.integer :distance
      t.integer :price
      t.integer :order_number
      t.string :avatar
      t.references :user, null: false, foreign_key: true, index: true
      t.string :aasm_state
      t.timestamps
    end
    add_index :orders, :order_number, unique: true
  end
end
