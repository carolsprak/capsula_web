class AddCartToOrders < ActiveRecord::Migration
  def change
  	add_reference :orders, :cart, foreign_key: true
  end
end
