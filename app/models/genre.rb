class Genre < ApplicationRecord

 	has_many :products

 	validates :name, presence: true

	 def active_genre
			"#{self.name}  (#{self.is_active ? '有効' : '無効'})"
	 end

end
