class AddcolumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birthday, :date
    remove_column :users, :provider
    remove_column :users, :uid
  end
end
