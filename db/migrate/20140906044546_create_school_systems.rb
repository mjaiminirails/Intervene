class CreateSchoolSystems < ActiveRecord::Migration
  def change
    create_table :school_systems do |t|
      t.string :name
      t.string :contact_person
      t.string :contact_email
      t.string :website
      t.string :title
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
