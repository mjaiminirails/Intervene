class CreateServiceProviderCategoryJoinTable < ActiveRecord::Migration
  def change
  	create_table :service_categories_providers do |t|
  		t.belongs_to :service_provider 
  		t.belongs_to :service_category
  	end
  end
end
