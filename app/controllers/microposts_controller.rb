class MicropostsController < ApplicationController
  before_filter :authenticate

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    # get_all_urls
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to dashboard_show_path
    else
      # get_feed_items
      render dashboard_show_path
    end
  end

  def destroy
    
  end

end