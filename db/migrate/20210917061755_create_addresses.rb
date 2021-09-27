class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :shipping_code, null: false
      t.string :shipping_address, null: false
      t.string :post_name, null: false
      t.timestamps null: false
    end
  end
end
