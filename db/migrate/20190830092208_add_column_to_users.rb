class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string,       null: false, default: ""
    add_column :users, :family_name, :string,       null: false, default: ""
    add_column :users, :first_name, :string,      null: false, default: ""
    add_column :users, :family_name_kana, :string,  null: false, default: ""
    add_column :users, :first_name_kana, :string, null: false, default: ""
    add_column :users, :birthday, :string,    null: false, default: ""
    add_column :users, :postal_code, :string, null: false, default: ""
    add_column :users, :prefecture, :string, null: false, default: ""
    add_column :users, :city, :string, null: false, default: ""
    add_column :users, :house_number, :string, null: false, default: ""
    add_column :users, :building_name, :string, default: ""
    add_column :users, :phone_number, :string, default: ""
    add_column :users, :profile_icon, :string, default: ""
    add_column :users, :self_introduction, :text
  end
end