class DashboardController < ApplicationController
  
  def show
    @user = current_user
    @urls = @user.urls
  end

end
