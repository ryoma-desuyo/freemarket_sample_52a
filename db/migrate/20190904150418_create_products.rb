class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :name,                 null: false
      t.text    :description,          null: false
      t.text    :image
      t.text    :category,             null: false, foreign_key: true
      t.text    :brand,                foreign_key: true
      t.text    :condition,            null: false
      t.text    :delivery_fee,         null: false
      t.string  :shipping_area,        null: false
      t.string  :days_before_shipping, null: false
      t.integer :price,                null: false
      t.string  :status,               null: false
      t.integer :seller_id,            null: false, foreign_key: true
      t.integer :buyer_id,             null: false, foreign_key: true
      t.timestamps                     null: true
    end
  end
end

