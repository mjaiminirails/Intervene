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
		p '=============='
		p '=============='
		category = ServiceCategory.find(params[:id])
		category.destroy
		redirect_to service_categories_path
	end

	def category_params
    params.require(:service_category).permit(:name)
  end
	

end

=begin
#see a list of service_categories
get '/service_categories' do
  @service_categories = ServiceCategory.all
  erb :service_category_index
end


#Add a service category to the list.
get '/service_categories/new' do
  erb :service_category_new
end

#create service category
post '/service_categories/new' do
  # this should also be new instead of create
  @service_category = ServiceCategory.create(:name => params[:service_category])
  if @service_category.save
    redirect "/service_categories/#{@service_category.id}"
  else
    redirect '/service_categories'
  end
end

#show service category
get '/service_categories/:id' do
  @service_category = ServiceCategory.find_by_id(params[:id])
  if @service_category
    erb :service_category_show
  else
    redirect '/'
  end
end


get '/service_categories/:id/edit' do
  @service_category= ServiceCategory.find_by_id(params[:id])
  erb :service_category_update
end

post '/service_categories/:id' do
  category = ServiceCategory.find_by_id(params[:id])
  category.name = params[:service_category]
  category.save
  redirect to "/service_categories/#{params[:id]}"
end

get '/service_categories/:id/delete' do
  @service_category = ServiceCategory.find_by_id(params[:id])
  erb :service_category_delete
end

post '/service_categories/:id/delete' do
  category = ServiceCategory.find_by_id(params[:id])
  category.destroy
  redirect to 'service_categories'
end


######## Users
get '/users' do
  erb :signup_page
end



post '/users/signin' do
  username = params[:username]
  if User.exists?(username: username)
    redirect to '/username_error'
  else
    user = User.new
    user.username = username
    user.save
    redirect to '/service_providers'
  end
end



get 'username_error' do
  erb :username_error
end

=end