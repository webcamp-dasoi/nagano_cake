class OrderProduct < ApplicationRecord
	 belongs_to :products
	  belongs_to :order
	  producing_status: {"着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3}
end
