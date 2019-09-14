class AddImageColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :image, false, 0
  end
end
