class Product < ApplicationRecord

	belongs_to :genre

	has_many :order_products
	has_many :orders, through: :order_products

	has_many :cart_products
	has_many :end_users, through: :cart_products

	attachment :image, destroy: false

	validates :name, presence: true
	validates :introduction, presence: true
	validates :non_tax_price, presence: true
	validates :image, presence: true

end
