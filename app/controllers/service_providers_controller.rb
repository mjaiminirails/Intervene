class ServiceProvidersController < ActionController::Base

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
		provider = ServiceProvider.find(params[:id])
		provider.update(provider_params)
		redirect_to service_provider_path(provider)
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