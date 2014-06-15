class CreateInterventionType < ActiveRecord::Migration
  def change
    create_table :intervention_types do |t|
    	t.string :name
    	t.text :description
    	t.timestamps
    end
  end
end


