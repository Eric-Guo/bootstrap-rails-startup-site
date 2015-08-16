class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :description
      t.datetime :start_date

      t.timestamps
    end
  end
end
