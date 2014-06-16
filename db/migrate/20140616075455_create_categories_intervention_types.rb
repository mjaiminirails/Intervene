class CreateCategoriesInterventionTypes < ActiveRecord::Migration
   def change
    create_table :categories_intervention_types, :id => false do |t|
      t.belongs_to :category
      t.belongs_to :intervention_type
      t.timestamps
    end
  end
end