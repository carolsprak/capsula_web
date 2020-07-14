class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :drink_id, index: true, foreign_key: true
      t.integer :quantity
      t.references :cart_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
