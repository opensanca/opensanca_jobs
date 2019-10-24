class AddBannedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :banned, :boolean, null: false, default: false
  end
end
