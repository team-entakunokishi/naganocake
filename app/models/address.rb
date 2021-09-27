class Address < ApplicationRecord
  belongs_to :customer
  validates :shipping_code, presence: true
  validates :shipping_address, presence: true
  validates :post_name, presence: true
  
  def view_address_all
    self.shipping_code + self.shipping_address + self.post_name
  end
end
