class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :user_name, :string
  	add_column :users, :city, :string
  	add_column :users, :phone, :string
  	add_column :users, :country, :string
  end
end
