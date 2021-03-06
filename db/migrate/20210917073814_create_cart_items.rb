class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, null: false
      t.integer :tax_including_price, null: false
      t.timestamps null: false
    end
  end
end
