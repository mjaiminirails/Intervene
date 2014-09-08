class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :principal
      t.string :mission
      t.string :image_url
      t.string :contact_person
      t.string :contact_email
      t.string :title
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :fax
      t.string :website

      t.belongs_to :school_district
      t.belongs_to :school_type
      t.belongs_to :grade_type
      t.belongs_to :grade_configuration

      t.timestamps
    end
  end
end