class AddMoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ideology, :string
    add_column :users, :country, :string
    add_column :users, :rating, :integer
  end
end
