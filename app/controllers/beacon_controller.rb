
class BeaconController < ApplicationController
    
  def yslow
    
    yslow2_attrs = {}
    grades = {}

    # raw_data = request.raw_post
    raw_data = JSON.parse request.raw_post
        
    site_url = CGI::unescape(raw_data.delete('u'))
    u = Url.find_or_create_by_url_name(site_url)
        
    yslow2_attrs = {
      :user_agent=>request.headers['User-Agent']
    }
    
    raw_data.each { |k,v| # iterate over top level JSON keys and populate attrs hash
      puts "k is #{k}"
      yslow2_attrs[k] = v.to_json
      puts "yslow2_attrs[k] is #{yslow2_attrs[k].to_json}"
    }
    
    yslow2_attrs[:url_id] = u.id
            
    y = Yslow2.new
    y.update_attributes(yslow2_attrs)
    y.save
    
    render :nothing => true
    
  end
  
  def page_speed  
  end

end
