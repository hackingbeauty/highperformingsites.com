module Yslow2Helper
  
  def json_to_hash(str,requested_key)
    str.each do |k,v|
      if k == requested_key
        if requested_key == "w"
          return number_to_human_size(v)
        else
          return v
        end
      end
    end
  end
  
  def file_type_name(type)
    yslow_type = case type
      when "cssimage" then "CSS Images"
      when "doc" then "HTML"
      when "js" then "JavaScript"
      when "css" then "CSS"
      when "image" then "Images"
      when "flash" then "Flash Components"
      when "iframe" then "Iframes"
    end
  end
  
  # def yslow_components(yslowItem)
  #   @components = yslowItem.url
  #   redirect_to
  # end
  # 
end
