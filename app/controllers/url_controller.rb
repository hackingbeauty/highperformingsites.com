class UrlController < ApplicationController
  before_filter :signed_in_user,   :only => :destroy
  
  def index
    @title = "Measure Your App's Front-End Performance"
    @urls = Url.find(:all)    
  end

  def show
    @the_url = Url.find(params[:id])
    @yslow2s = current_user.urls.find_by_id(params[:id]).yslow2s.find(:all, :order => 'lt ASC')
  end
  
  def destroy
    Url.find(params[:id]).destroy
    flash[:success] = "Url deleted"
    redirect_to dashboard_show_path
  end
  
  def trends
    url_id = params[:id]
    @the_url = Url.find_by_id(url_id)
  end
  
  # Ajax function
  def get_trends
    record = params[:id]
    render :nothing => true
  end
  
  private
  
    def signed_in_user
      redirect_to(signin_path) unless current_user
    end

end
