module UrlHelper
  
  def load_time(milliseconds)
    milliseconds.to_f/1000

  end
  
  def readable_time_stamp(utc)
    time = Time.parse(utc)
    time.strftime("%B %d, %Y at %I:%M %p")
  end
  
  def url_display(url)
    url = Domainatrix.parse(url)
    display_url = "#{url.domain}.#{url.public_suffix }#{url.path}"
  end

end
