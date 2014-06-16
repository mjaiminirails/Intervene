class CreateInterventionTypesServiceProvidersJoinTable < ActiveRecord::Migration
  def change
    create_table :intervention_types_service_providers, id: false do |t|
      t.belongs_to :service_provider
      t.belongs_to :intervention_type
      t.timestamps
    end
  end
end