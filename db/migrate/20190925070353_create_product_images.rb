class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.text   :image, nill:false
      t.string :product_id, null:false
      t.timestamps
    end
    add_index :product_images, :product_id
  end
end
