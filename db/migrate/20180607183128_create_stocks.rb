class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :drink_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
