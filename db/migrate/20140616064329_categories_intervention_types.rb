class CategoriesInterventionTypes < ActiveRecord::Migration
   def change
    create_table :categories_intervention_types, :id => false do |t|
      t.integer :categories_id
      t.integer :intervention_type_id
      t.timestamps
    end
  end
end