class CreateCategoriesServiceProviders < ActiveRecord::Migration
  def change
    create_table :categories_service_providers, id:false do |t|
      t.belongs_to :category
      t.belongs_to :service_provider
      t.timestamps
    end
  end
end

