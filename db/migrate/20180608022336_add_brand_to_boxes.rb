class AddBrandToBoxes < ActiveRecord::Migration
  def change
  	add_reference :boxes, :brand, foreign_key: true
  end
end
