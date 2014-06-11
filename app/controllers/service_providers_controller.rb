class ServiceProvidersController < ApplicationController

	def index
		@providers = ServiceProvider.order('name asc').all
	end

	def new
		@provider = ServiceProvider.new
		@categories = ServiceCategory.order('name asc').all
	end

	def create
		@provider = ServiceProvider.new(provider_params)
		@category_ids = params[:categories]
		if @provider.save
			if @category_ids
				@category_ids.each do |cid|
					@provider.service_categories << ServiceCategory.find_by(id: cid)
				end
			end
			redirect_to service_provider_path(@provider)
		else
			@categories = ServiceCategory.order('name asc').all
			render new_service_provider_path
		end
	end

	def show
		@provider = ServiceProvider.find(params[:id])
		@categories = @provider.service_categories.order('name asc')
	end

	def edit
		@provider = ServiceProvider.find(params[:id])
		@all_categories = ServiceCategory.order('name asc').all
		@selected_cats = @provider.service_categories
	end

	def update
		@provider = ServiceProvider.find(params[:id])
		@category_ids = params[:categories]
		if @provider.update(provider_params)			
			@provider.service_categories.clear
			if @category_ids
				@category_ids.each do |cid|
					@provider.service_categories << ServiceCategory.find_by(id: cid)
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
    					:other
    		)
  end

end