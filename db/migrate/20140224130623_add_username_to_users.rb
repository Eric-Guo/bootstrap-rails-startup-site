class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :badge, :string
    add_index :users, :badge, unique: true
  end
end
