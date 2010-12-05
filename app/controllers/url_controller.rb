class UrlController < ApplicationController
  
  def index
    @title = "Measure Your App's Front-End Performance"
    @urls = Url.find(:all)    
  end

  def show
    url = Url.find(params[:id])
    @the_url = Url.find(params[:id])
    @yslow2_scores = url.yslow2s.find(:all)
    @page_speed_scores = url.page_speeds.find(:all)
  end
  
  private

end
