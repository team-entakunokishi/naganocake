class Order < ApplicationRecord
  belongs_to :customer
	has_many :order_items, dependent: :destroy
	validates :customer_id, presence: true
	validates :shipping_code, presence: true
	validates :shipping_address, presence: true
	validates :post_name, presence: true
	validates :shipping_code, length: {is: 7}, numericality: { only_integer: true }
	validates :total_price, numericality: { only_integer: true }
	enum payment_method: {"クレジットカード": 1,"銀行振込": 2}
	enum order_status: {"入金待ち": 1,"入金確認": 2,"製作中": 3,"発送準備中": 4, "発送済み": 5}


	after_update do
      if self.order_status == "入金確認"
        self.order_items.each {|order_item|
        order_item.update(product_status: "製作待ち")
        }
      end
    end



end
