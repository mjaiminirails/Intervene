class CreateGradeConfigurations < ActiveRecord::Migration
  def change
      create_table :grade_configurations do |t|
      t.string :name

      t.belongs_to :school

      t.timestamps
    end
  end
end