class AddProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :self_introduction, :string
    add_column :users, :address, :string
  end
end
