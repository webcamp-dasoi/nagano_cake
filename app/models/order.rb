class Order < ApplicationRecord

  belongs_to :end_user

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products

  enum payment_method: {"クレジットカード": 0, "銀行振込": 1}

  enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}

  validates :shipping_post_number, format: {with: /\A\d{3}[-]\d{4}\z/ }
  validates :shipping_post_number, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true


  # 請求金額
  def amount_billed
    (total_price + shipping_cost).floor.to_s(:delimited)
  end


end
