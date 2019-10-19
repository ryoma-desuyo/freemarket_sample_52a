class GetColumnToUsers < ActiveRecord::Migration[5.2]
  def down
    remove_column :users, :provider, nil
    remove_column :users, :uid, nil
  end

  def up
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    change_column :users, :birthday, :date, null: true
  end
end
