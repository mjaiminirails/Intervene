class CreateJoinTableGuardiansStudents < ActiveRecord::Migration
  def change
    create_table :guardians_students, :id => false do |t|
      t.belongs_to :guardians
      t.belongs_to :students
    end
  end
end
