class RemoveBrandIdFromDrinks < ActiveRecord::Migration
  def change
    remove_column :drinks, :brand_id, :integer
  end
end
