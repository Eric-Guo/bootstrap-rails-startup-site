class CreateStrangers < ActiveRecord::Migration
  def change
    create_table :strangers do |t|
      t.string :session_id
      t.integer :stay_seconds, :null => false, :default => 0

      t.timestamps
    end
  end
end
