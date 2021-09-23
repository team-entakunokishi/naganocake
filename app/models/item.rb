class Item < ApplicationRecord
  belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :item_orders, dependent: :destroy
	 attachment :image
	validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :exaple, presence: true
  validates :is_sell_status, inclusion: {in: [true, false]}
end
