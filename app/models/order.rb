class Order < ApplicationRecord

  belongs_to :end_user

  has_many :order_products
  has_many :products, through: :order_products

  enum payment_method: {"クレジットカード": 0, "銀行振込": 1}

  enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}

  validates :shipping_post_number, format: {with: /\A\d{3}[-]\d{4}\z/ }

end
