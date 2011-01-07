class PagesController < ApplicationController
  def home
    if signed_in?
      redirect_to dashboard_show_path
    else
      @title = "Create an account and start tracking your app"
      @user = User.new
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

end
