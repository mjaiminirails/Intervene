class HomeController < ApplicationController

	def index
		@user = current_app_user
    @providers = ServiceProvider.all
	end

  def trial
  end
end
