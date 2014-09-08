class CreateStudents < ActiveRecord::Migration
   def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :identification_number
      t.string :date_of_birth
      t.string :image_url
      t.string :remote_image_url
      t.string :email
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :cell_phone
      t.string :counselor
      t.string :grade_level
      t.string :offical_class
      t.string :cohort
      t.string :gender

      t.belongs_to :school
      t.belongs_to :referral
      t.timestamps
    end
  end
end
