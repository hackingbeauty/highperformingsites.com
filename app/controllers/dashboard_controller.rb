class DashboardController < ApplicationController
  
  def show
    # @user = current_user
    @urls = current_user.urls.find(:all)
  end

end
