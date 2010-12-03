require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get "/"
    response.should have_selector("title", :content => "Measure Your App's Front-End Performance")
  end

  it "should have a Contact page at /contact'" do
    get "/contact"
    response.should have_selector("title", :content => "Contact")
  end
  
  it "should have an About page at '/about'" do
    get "/about"
    response.should have_selector("title", :content => "About")
  end
  
end
