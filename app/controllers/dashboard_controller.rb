class DashboardController < ApplicationController
  
  def show
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @api_key = current_user.api_key
    end
    get_all_urls
  end

end
