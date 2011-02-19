module UrlHelper
  
  def load_time(milliseconds)
    milliseconds.to_f/1000

  end
  
  def readable_time(utc)
    time = Time.parse(utc)
    time.strftime("%B %d, %Y at %I:%M %p")
  end
    
end
