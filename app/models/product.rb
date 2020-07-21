class Product < ApplicationRecord

	belongs_to :genre

	has_many :order_products
	has_many :orders, through: :order_products

	has_many :cart_products
	has_many :end_users, through: :cart_products

	attachment :image, destroy: false

end
