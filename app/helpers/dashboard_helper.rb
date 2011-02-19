module DashboardHelper
  def get_all_urls
    @urls = current_user.urls.find(:all)
  end
end
