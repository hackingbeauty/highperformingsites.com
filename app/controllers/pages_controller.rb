class PagesController < ApplicationController
  def home
    @title = "Create an account and start tracking your app"
    @user = User.new
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

end
