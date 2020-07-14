class Cart < ActiveRecord::Base
	belongs_to :drink
	belongs_to :user
	has_many :orders
	has_many :cart_items

	def add_drink(drink_params)
		current_item = cart_items.find_by(drink_id drink_params[:drink][:drink_id])

		if current_item
			current_item.quantity += drink_params[:drink][:quantity].to_i
			current_item.save
		else
			new_item = cart_items.create(drink_id: drink_params[:drink][:drink_id],
											quantity: drink_params[:drink][:quantity],
											cart_id: self.id)
		end

		new_item
	end
end
