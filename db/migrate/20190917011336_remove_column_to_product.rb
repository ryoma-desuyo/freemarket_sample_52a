class RemoveColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :status
  end
end
