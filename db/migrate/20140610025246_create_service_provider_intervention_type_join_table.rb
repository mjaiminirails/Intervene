class CreateServiceProviderInterventionTypeJoinTable < ActiveRecord::Migration
  def change
  	create_table :intervention_types_service_providers do |t|
  		t.belongs_to :service_provider 
  		t.belongs_to :intervention_type
  	end
  end
end
