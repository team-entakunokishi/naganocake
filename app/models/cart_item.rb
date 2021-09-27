class CartItem < ApplicationRecord
  belongs_to :item
	belongs_to :customer

	validates :customer_id, presence: true
	validates :item_id, presence: true
	validates :quantity, presence: true

	def tax_including_price #税
		(item.price.to_i * 1.1).floor
	end

	def sub_price #小計
		self.tax_including_price * self.quantity
	end

	def total_money #合計金額
		CartItem.total_money
	end
end