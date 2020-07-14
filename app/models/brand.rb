class Brand < ActiveRecord::Base
	has_many :drinks
	has_many :boxes
end
