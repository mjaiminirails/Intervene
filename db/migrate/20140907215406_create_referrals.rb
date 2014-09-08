class CreateReferrals < ActiveRecord::Migration
 def change
    create_table :referrals do |t|
      t.string :comment
      t.belongs_to :app_user
      t.belongs_to :student
      t.belongs_to :school, :null => false

      t.timestamps
    end
  end
end
