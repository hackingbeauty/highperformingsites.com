require 'spec_helper'

describe DashboardController do
  
  describe "GET 'show'" do
    
    before(:each) do
      micropost = mock("Micropost")
      controller.stub_chain(:current_user, :feed, :paginate).and_return(micropost)
      urls = [] 
      10.times {|x| urls << mock("url")}
      controller.stub_chain(:current_user, :urls, :find).and_return(urls)
    end
    
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  
  end

end
