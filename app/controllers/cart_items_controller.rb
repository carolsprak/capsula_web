class CartItemsController < ApplicationController
	before_action :set_cart, only: [:create, :destroy]
	before_action :set_cart_item, only: [:destroy]

	def create
  		@cart.add_drink(params)

  		if @cart.save
  			redirect_to cart_path
  		else
  			flash[:error] = 'Foi encontrado um problema ao adicionar um item ao carrinho.'
  			redirect_to @drink
  		end
 	end

	def destroy
		@cart_item.destroy
		redirect_to cart_path
	end

	private
		def set_cart_item
			@cart_item = CartItem.find([params[:id]])
		end

		def cart_item_params
			params.require(:cart_item).permit(:drink_id, :cart_id, :quantity)			
		end
end