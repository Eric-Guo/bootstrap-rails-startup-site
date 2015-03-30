class AddStaySecondsToUser < ActiveRecord::Migration
  def change
    add_column :users, :stay_seconds, :integer, :null => false, :default => 0
  end
end
