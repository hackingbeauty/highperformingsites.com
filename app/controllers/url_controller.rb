class UrlController < ApplicationController
  
  def index
    @title = "Measure Your App's Front-End Performance"
    @urls = Url.find(:all)    
  end

  def show
    @the_url = Url.find(params[:id])
    @urls = current_user.urls.find_by_id(params[:id]).yslow2s.find(:all, :order => 'lt DESC')
  end
  
  private

end
