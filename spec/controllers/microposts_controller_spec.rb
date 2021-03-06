require 'spec_helper'

describe MicropostsController do
  render_views
  # before(:each) do
  #   controller.stub_chain(:get_all_urls).and_return([])
  # end
  describe "access control" do
  
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end
    
    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  
  end
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = { :content => "" }
      end
      
      pending "should not create a micropost" do
        lambda do
          post :create, :micropost => @attr
        end.should_not change(Micropost, :count)
      end
      
      pending "should render the home page" do
        post :create, :micropost => @attr
        response.should render_template(dashboard_show_path)
      end
      
    end
    
    describe "success" do
      
      before(:each) do
        @attr = { :content => "Lorem ipsum" }
      end
      
      it "should create a micropost" do
        lambda do
          post :create, :micropost => @attr
        end.should change(Micropost, :count).by(1)
      end
      
      it "should redirect to the dashboard page" do
        post :create, :micropost => @attr
        response.should redirect_to(dashboard_show_path)
      end
      
      it "should have a flash message" do
        post :create, :micropost => @attr
        flash[:success].should =~ /micropost created/i
      end
      
    end
    
  end
  
end