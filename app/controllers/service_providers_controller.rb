class ServiceProvidersController < ApplicationController

	def index
		@providers = ServiceProvider.all.where(published: true)
	end

	def allindex
		@providers = ServiceProvider.order('name asc').all
	end

	def new
		@provider = ServiceProvider.new
		@interventiontypes = InterventionType.order('name asc').all
	end

	def create
		@provider = ServiceProvider.new(provider_params)
		@interventiontype_ids = params[:interventiontypes]
		if @provider.save
			if @interventiontype_ids
				@interventiontype_ids.each do |type_id|
					@provider.intervention_types << InterventionType.find_by(id: type_id)
				end
			end
			redirect_to service_provider_path(@provider)
		else
			@interventiontypes = InterventionType.order('name asc').all
			render new_service_provider_path
		end
	end

	def show
		@provider = ServiceProvider.find(params[:id])
		@interventiontypes = @provider.intervention_types.order('name asc')
	end

	def edit
		@provider = ServiceProvider.find(params[:id])
		@all_interventiontypes = InterventionType.order('name asc').all
		@selected_types = @provider.intervention_types
	end

	def update
		@provider = ServiceProvider.find(params[:id])
		@interventiontype_ids = params[:interventiontypes]
		if @provider.update(provider_params)
			@provider.intervention_types.clear
			if @interventiontype_ids
				@interventiontype_ids.each do |type_id|
					@provider.intervention_types << InterventionType.find_by(id: type_id)
				end
			end

			redirect_to service_provider_path(@provider),
					notice: "Service Provider updated successfully!"

		else
			@err = @provider.errors.full_messages
			redirect_to edit_service_provider_path(@provider),
					:flash => { notice: "Invalid. Service provider NOT updated.",
											errors: @err
										}
		end
	end

	def destroy
		provider = ServiceProvider.find(params[:id])
		provider.destroy
		redirect_to service_providers_path
	end

	def provider_params
    params.require(:service_provider).
    	permit( :name,
    					:mission,
              :image,
    					:street1,
    					:street2,
    					:city,
    					:state,
    					:zip_code,
    					:website,
    					:contact_person,
    					:contact_email,
    					:work_phone,
    					:fax,
    					:other,
    					:published
    		)
  end

end