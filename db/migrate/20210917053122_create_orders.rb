class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customers_id, null: false
      t.integer :total_amount, null: false
      t.integer :method_of_payment, null: false, default: 1
      t.integer :postage, null: false
      t.string :shipping_address, null: false
      t.string :shipping_code, null: false
      t.integer :order_status, null: false, default: 1
      t.string :post_name, null: false
      t.timestamps null: false
    end
  end
end
