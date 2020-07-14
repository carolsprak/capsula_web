class Order < ActiveRecord::Base
	belongs_to :cart
	has_many :sales

	PAYMENT_TYPES  = ["Boleto", "PayPal", "PagSeguro"]
end
