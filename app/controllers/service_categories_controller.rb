class ServiceCategoriesController < ActionController::Base

	def index
		@categories = ServiceCategory.all
	end

	def new
		@category = ServiceCategory.new
	end

	def create
		@category = ServiceCategory.new(category_params)
		if @category.save
			redirect_to service_category_path(@category)
		else
			render new_service_category_path
		end
	end

	def show
		@category = ServiceCategory.find(params[:id])
	end

	def edit
		@category = ServiceCategory.find(params[:id])
	end

	def update
		category = ServiceCategory.find(params[:id])
		category.update(category_params)
		redirect_to service_category_path(category)
	end

	def destroy
		category = ServiceCategory.find(params[:id])
		category.destroy
		redirect_to service_categories_path
	end

	def category_params
    params.require(:service_category).permit(:name)
  end

end