class AddAdminToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :account_status, :integer, default: 0
  end
end
