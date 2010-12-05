
class BeaconController < ApplicationController
    
  def yslow
    
    yslow2_attrs = {}

    raw_data = JSON.parse request.raw_post
      
    site_url = CGI::unescape(raw_data.delete('u'))
    # site_url = request.env['HTTP_HOST']
    url = Url.find_or_create_by_name(site_url)
              
    yslow_beacon = request.query_parameters.to_s.chop
    user = User.find_by_api_key(yslow_beacon)
    
    puts "the user that was found is #{user.id}"
        
    url[:user_id] = user.id 
    url.save   
    
    
    puts "url[:user_id] is #{url[:user_id]}"
        
    yslow2_attrs = {
      :user_agent=>request.headers['User-Agent']
    }
    
    raw_data.each { |k,v| # iterate over top level JSON keys and populate yslow2_attrs hash
      yslow2_attrs[k] = v.to_json
    }
    
    yslow2_attrs[:url_id] = url.id
            
    y = Yslow2.new
    y.update_attributes(yslow2_attrs)
    y.save
    
    render :nothing => true
    
  end
  
  def page_speed  
  end

end
