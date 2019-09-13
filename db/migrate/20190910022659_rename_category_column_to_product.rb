class RenameCategoryColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :category, :product_category_id
    rename_column :products, :saller_id, :seller_id
  end
end
