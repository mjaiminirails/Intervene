class HomeController < ApplicationController

	def index
		@user = current_app_user
	end
	
end
