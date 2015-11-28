class Crawler
  attr_accessor :resp, :clues 
  
  def initialize(page = 0)
    url = "http://jeopardy-questions.tumblr.com"
    if page > 0
      url << "/page/#{page}"
    end

    response = open(url)
    @clues = []
    @resp = Nokogiri::HTML(response)
    @resp.css("div.data.lP").each do |node|
      @clues << Clue.new image: node.css("img").first.src, answer: node.css("p").first.to_s
    end
  end
end
