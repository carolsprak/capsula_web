class Drink < ActiveRecord::Base
	belongs_to :brand
	has_many :stocks
	has_many :carts
	
end
