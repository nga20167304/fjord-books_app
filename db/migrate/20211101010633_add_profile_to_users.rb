class AddProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :bio, :string
    add_column :users, :address, :strinng
  end
end
