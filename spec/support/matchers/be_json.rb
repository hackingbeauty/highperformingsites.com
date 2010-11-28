RSpec::Matchers.define :be_json do |expected_json| 
  match do |response| 
    json = ActiveSupport::JSON::decode(response.body) 
    json.should == expected_json 
  end 
end