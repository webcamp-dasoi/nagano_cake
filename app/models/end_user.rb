class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :orders

  validates :first_name, format: {with: /\A[一-龥]+\z/ }
  validates :last_name, format: {with: /\A[一-龥]+\z/ }
  validates :kana_first_name, format: {with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :kana_last_name, format: {with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :post_number, format: {with: /\A\d{3}[-]\d{4}\z/ }, presence: true
  validates :address, presence: true
  validates :telephone_number, format: {with: /\A\d{10,11}\z/ }, presence: true
end
