class RemoveIdFromInterventionTypesServiceProviders < ActiveRecord::Migration
  def change
    remove_column :intervention_types_service_providers, :id, :integer
  end
end
