class AddAddressToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :address, :text
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
