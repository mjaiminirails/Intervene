class CreateGradeTypes < ActiveRecord::Migration
  def change
    create_table :grade_types do |t|
      t.string :name
      t.belongs_to :school
      t.timestamps
    end
  end
end
