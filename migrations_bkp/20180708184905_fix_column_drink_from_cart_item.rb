class FixColumnDrinkFromCartItem < ActiveRecord::Migration
   	def change
    	rename_column :cart_item, :drink_id, :product_id
  	end

end
