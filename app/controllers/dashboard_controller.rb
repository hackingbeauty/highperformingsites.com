class DashboardController < ApplicationController
  
  def show
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @api_key = current_user.api_key
      @tracked_sites = current_user.urls.size
    end
    get_all_urls
  end

end
