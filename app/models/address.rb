class Address < ApplicationRecord

	belongs_to :end_user

	validates :post_number, format: {with: /\A\d{3}[-]\d{4}\z/ }

	validates :name, presence: true
	validates :post_number, presence: true
	validates :address, presence: true

end
