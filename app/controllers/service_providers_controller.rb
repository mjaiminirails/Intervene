class ServiceProvidersController < ApplicationController

	def index
		@providers = ServiceProvider.all
	end

	def new
		@provider = ServiceProvider.new
	end

	def create
		@provider = ServiceProvider.new(provider_params)
		if @provider.save
			redirect_to service_provider_path(@provider)
		else
			render new_service_provider_path
		end
	end

	def show
		@provider = ServiceProvider.find(params[:id])
	end

	def edit
		@provider = ServiceProvider.find(params[:id])
	end

	def update
		@provider = ServiceProvider.find(params[:id])
		if @provider.update(provider_params)
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
		redirect_to service_categories_path
	end

	def provider_params
    params.require(:service_provider).permit(:name)
  end

end