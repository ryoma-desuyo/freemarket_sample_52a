class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    change_column :users, :birthday, :date, null: true
  end
end
