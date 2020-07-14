class AddOrderToSales < ActiveRecord::Migration
  def change
  	add_reference :sales, :order, foreign_key: true
  end
end
