class OrderProduct < ApplicationRecord
	 belongs_to :product
	 belongs_to :order
	 enum producing_status: {"着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3}

	 def subtotal_price
		(product.non_tax_price * quantity * 1.1).floor.to_s(:delimited)
	 end
	 # 計算式用
	 def subtotal_calculation
	 	product.non_tax_price * quantity * 1.1
	 end

end
