class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.references :project, index: true
      t.references :suite, index: true
      t.string :case_name
      t.string :description
      t.references :tester_user, index: true

      t.timestamps
    end
  end
end
