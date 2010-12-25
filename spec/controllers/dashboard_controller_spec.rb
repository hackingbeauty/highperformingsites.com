require 'spec_helper'

describe DashboardController do
  
  describe "GET 'show'" do
    
    before(:each) do
      url = mock("Url")
      controller.stub_chain(:current_user, :urls, :find).and_return(url)
    end
    
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

end
