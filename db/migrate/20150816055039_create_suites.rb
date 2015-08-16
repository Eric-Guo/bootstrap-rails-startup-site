class CreateSuites < ActiveRecord::Migration
  def change
    create_table :suites do |t|
      t.references :project, index: true
      t.string :suite_name
      t.string :description

      t.timestamps
    end
  end
end
