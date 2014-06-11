class CreateServiceProvider < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
    	t.string :name
    	t.string :mission
    	t.string :image
    	t.string :remote_image_url;
    	t.string :website
    	t.string :providers_email
    	t.string :contact_person
    	t.string :contact_email
    	t.string :street1
    	t.string :street2
    	t.string :city
    	t.string :state
    	t.string :zip_code
    	t.string :work_phone
    	t.string :fax
    	t.string :infraction_supported
        t.boolean :published, default: false
    	t.text :other
    	t.timestamps
    end
  end
end