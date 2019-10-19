class GetColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :provider
    remove_column :users, :uid
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    change_column :users, :birthday, :date, null: true
  end
end
