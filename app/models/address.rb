class Address < ApplicationRecord

	belongs_to :end_user

	validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}

end
