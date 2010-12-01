class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome! Start tracking your app!"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end
  
  def check_email
    email = User.find_by_email(params[:user][:email])
    respond_to do |response|
      if email
        response.js {render :json => false}
      else
        response.js {render :json => true}
      end
    end

  end

end
