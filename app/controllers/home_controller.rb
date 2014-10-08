class HomeController < ApplicationController

  def index
    @user = current_app_user
    @providers = ServiceProvider.all
    @categories = @providers.map {|provider| provider.uniq_categories}.flatten.uniq
  end

  def trial
  end
end
