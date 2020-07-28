class CartProduct < ApplicationRecord

	belongs_to :end_user
	belongs_to :product

	validates :quantity, presence: true


	 def subtotal_price
		(product.non_tax_price * quantity * 1.1).floor.to_s(:delimited)
	 end
	 # 計算式用
	 def subtotal_calculation
	 	product.non_tax_price * quantity * 1.1
	 end

end
