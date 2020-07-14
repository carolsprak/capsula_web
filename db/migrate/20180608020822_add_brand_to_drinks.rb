class AddBrandToDrinks < ActiveRecord::Migration
  def change
  	add_reference :drinks, :brand, foreign_key: true
  end
end
