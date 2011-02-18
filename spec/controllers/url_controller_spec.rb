require 'spec_helper'

describe UrlController do
  
  before(:each) do
    @url = Factory(:url)
  end
  
  describe "DELETE 'destroy'" do

    describe "as a non signed-in user" do
    
      it "should deny access" do
        delete :destroy, :id => @url
        response.should redirect_to(signin_path)
      end
    
    end
  
  describe "as a signed-in user" do
  
    before(:each) do
      user = Factory(:user, :email => "admin@example.com", :admin => true)
      test_sign_in(user)
    end
  
    it "should destroy the URL" do
      lambda do
        delete :destroy, :id => @url
      end.should change(Url, :count).by(-1)
    end
    
    it "should redirect to the dashboard page" do
      delete :destroy, :id => @url
      response.should redirect_to(dashboard_show_path)
    end
  
  end
  
  end
  
end