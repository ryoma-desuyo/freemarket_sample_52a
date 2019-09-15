class ChangeColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :buyer_id, :integer, null: true, default: 0
    change_column_null :products, :image, false, 0
  end
end
