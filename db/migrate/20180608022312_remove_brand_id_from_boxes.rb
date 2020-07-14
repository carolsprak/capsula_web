class RemoveBrandIdFromBoxes < ActiveRecord::Migration
  def change
    remove_column :boxes, :brand_id, :integer
  end
end
