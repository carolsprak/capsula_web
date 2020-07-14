class CartItem < ActiveRecord::Base
  belongs_to :drink_id
  belongs_to :cart_id
end
