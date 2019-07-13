class AddOnlineToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :online, :boolean, default: false
    add_column :users, :role, :string
  end
end
