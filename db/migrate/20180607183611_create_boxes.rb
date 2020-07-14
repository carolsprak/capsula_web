class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :brand_id
      t.integer :box_limite
      t.integer :box_price

      t.timestamps null: false
    end
  end
end
