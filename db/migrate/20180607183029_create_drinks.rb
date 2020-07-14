class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :brand_id
      t.string :drink_type
      t.string :drink_category
      t.text :description
      t.integer :qt_capsule

      t.timestamps null: false
    end
  end
end
