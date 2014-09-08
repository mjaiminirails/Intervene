class CreateGuardianRoles < ActiveRecord::Migration
  def change
    create_table :guardian_roles do |t|
      t.string :name
      t.belongs_to :guardian
      t.timestamps
    end
  end
end

