class Crawler
  attr_accessor :resp 
  
  def initialize(page = 0)
    url = "http://jeopardy-questions.tumblr.com"
    if page > 0
      url << "/page/#{page}"
    end

    response = open(url)
    @resp = Nokogiri::HTML(response)
    @resp.css("div.data.lP").map! do |node|
      Clue.new image: node.css("img").first.src, answer: node.css("p").first.to_s
    end
  end
end
