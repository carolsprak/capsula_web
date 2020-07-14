class RemoveDrinkIdFromStocks < ActiveRecord::Migration
  def change
    remove_column :stocks, :drink_id, :integer
  end
end
