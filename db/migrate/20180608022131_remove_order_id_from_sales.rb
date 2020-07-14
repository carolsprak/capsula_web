class RemoveOrderIdFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :order_id, :integer
  end
end
