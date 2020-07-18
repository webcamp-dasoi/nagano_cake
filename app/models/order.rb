class Order < ApplicationRecord
  
  belongs_to :end_user

  enum order_status: {"クレジットカード": 0, "銀行振込": 1}

  enum payment_method: {"入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4}

  validates :shipping_post_number, format: {with: /\A\d{3}[-]\d{4}\z/ }

end
