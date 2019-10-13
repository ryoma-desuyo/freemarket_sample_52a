class RenameProductCategoryIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :product_category, :product_category
  end
end
