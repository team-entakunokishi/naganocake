class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genres_id, null: false
      t.string :name, null: false
      t.string :example, null: false
      t.boolean :is_sell_status, null: false, default: false
      t.string :image_id, null: false
      t.timestamps null: false
    end
  end
end
