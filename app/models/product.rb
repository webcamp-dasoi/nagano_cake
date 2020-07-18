class Product < ApplicationRecord
	belongs_to :genre
	#ordersと多対多
	has_many :order_products
	has_many :orders, through: :order_products

	# end_usersと多対多
	has_many :cart_products
	has_many :end_users, through: :cart_products
end
