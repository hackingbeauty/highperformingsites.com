class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
    @urls = @user.urls
    # puts @user.urls.find(:first).yslow2s.all(:select => "lt, created_at").to_json

    #yada = @user.urls.find(:first).yslow2s.find(:all, :select => "lt, created_at").map{|x| {"loadTime" => x.lt, "timeStamp" => x.created_at.to_i}.to_json}

    # JavaScript JSON Object I want:
    # var coordinate = { "coordinates" : [ {"loadTime":"1.3.2424","timeStamp":"1231233424234"},
    #                                      {"loadTime":"3.25234","timeStamp":"23423423423423"} ]
    #                  }
  
  end

  def index
    @title = "All Users"
    @users = User.all
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome! Start tracking your app! This is your KEY: #{@user.api_key}"
      redirect_to dashboard_show_path
    else
      @title = "Sign Up"
      render 'new'
    end
  end
  
  def edit
    # @user = User.find(params[:id]) -> you can omit this line because before_filter correct_user does it already
    @title = "Edit User"
  end
  
  def update
    # @user = User.find(params[:id]) -> you can omit this line because before_filter correct_user does it already
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit User"
      render 'edit'
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
  
  private
  
    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
