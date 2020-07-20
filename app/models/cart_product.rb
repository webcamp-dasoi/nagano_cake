class CartProduct < ApplicationRecord

	belongs_to :end_user
	belongs_to :product

	def tax_price
		product.non_tax_price * 1.1
	end

	def total_price
		product.non_tax_price * quantity * 1.1
	end

end
