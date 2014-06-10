class HomeController < ActionController::Base

	def index
		@user = current_app_user
	end
	
end
