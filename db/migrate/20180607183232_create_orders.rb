class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.float :total_price
      t.float :shipping_price
      t.integer :user_id
      t.date :order_date
      t.text :address
      t.string :payment_type

      t.timestamps null: false
    end
  end
end
