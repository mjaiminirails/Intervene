class ServiceProvidersController < ApplicationController

	def index
		@providers = ServiceProvider.all.where(published: true)
    # @categories = Category.all
	end

	def allindex
		@providers = ServiceProvider.order('name asc').all
	end

	def new
		@provider = ServiceProvider.new
    @categories = Category.order('name asc').all
    @subcategories = Subcategory.order('name asc').all
	end

	def create
		@provider = ServiceProvider.new(provider_params)
    @subcategory_ids = params[:subcategories]
    if @provider.save
      if @subcategory_ids
        @subcategory_ids.each do |subcategory_id|
          @provider.subcategories << Subcategory.find_by(id: subcategory_id)
        end
      end
		redirect_to service_provider_path(@provider)
		else
      @category = Category.order('name asc').all
			render new_service_provider_path
		end
	end

	def show
		@provider = ServiceProvider.find(params[:id])
    @subcategories = @provider.subcategories.order('category_id')
    @categories = @provider.uniq_categories
	end

	def edit
		@provider = ServiceProvider.find(params[:id])
		@all_categories = Category.order('name asc').all
		@selected_subcategories = @provider.subcategories
	end

	def update
		@provider = ServiceProvider.find(params[:id])

    @subcategory_ids = params[:subcategories]
    if @provider.update(provider_params)
      @provider.subcategories.clear
      if @subcategory_ids
        @subcategory_ids.each do |subcategory_id|
          @provider.subcategories << Subcategory.find_by(id: subcategory_id)
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