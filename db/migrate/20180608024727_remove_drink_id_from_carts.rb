class RemoveDrinkIdFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :drink_id, :integer
  end
end
