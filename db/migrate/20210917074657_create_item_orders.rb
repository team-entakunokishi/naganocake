class CreateItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :item_orders do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :quantity, null: false
      t.integer :product_status, null: false, default: 1
      t.integer :tax_including_price, null: false
      t.timestamps null: false
    end
  end
end
