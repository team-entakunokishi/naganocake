class Order < ApplicationRecord
  belongs_to :customer
  has_many :item_orders, dependent: :destroy
  
end