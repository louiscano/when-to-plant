class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :prenom, :string
    add_column :users, :nom, :string
    add_column :users, :role, :string
  end
end
