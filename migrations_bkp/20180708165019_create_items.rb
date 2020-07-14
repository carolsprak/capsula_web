class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_type
      t.string :item_description
      t.integer :brand_id
      t.integer :price

      t.timestamps null: false
    end
  end
end
