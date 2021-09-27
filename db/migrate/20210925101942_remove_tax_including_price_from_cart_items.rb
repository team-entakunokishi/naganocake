class RemoveTaxIncludingPriceFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :tax_including_price, :integer
  end
end
