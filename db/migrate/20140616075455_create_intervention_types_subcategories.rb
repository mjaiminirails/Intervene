class CreateInterventionTypesSubcategories < ActiveRecord::Migration
   def change
    create_table :intervention_types_subcategories, :id => false do |t|
      t.belongs_to :subcategory
      t.belongs_to :intervention_type
      t.timestamps
    end
  end
end