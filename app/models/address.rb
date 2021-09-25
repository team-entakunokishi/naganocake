class Address < ApplicationRecord
  belongs_to :customer
  validates :shipping_code, presence: true
  validates :shipping_address, presence: true
  validates :post_name, presence: true
end
