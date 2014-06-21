class CreateServiceProvidersSubcategories < ActiveRecord::Migration
  def change
    create_table :service_providers_subcategories, id:false do |t|
      t.belongs_to :service_provider
      t.belongs_to :subcategory
      t.timestamps
    end
  end
end

