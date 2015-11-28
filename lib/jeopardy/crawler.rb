class Crawler
  attr_accessor :resp 
  
  def initialize(page = 0)
    url = "http://jeopardy-questions.tumblr.com"
    if page > 0
      url << "/page/#{page}"
    end
    
    response = open(url)
    @resp = Nokogiri::HTML(response)
  end
end