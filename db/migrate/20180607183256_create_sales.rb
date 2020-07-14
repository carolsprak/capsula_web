class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :order_id
      t.string :status

      t.timestamps null: false
    end
  end
end
