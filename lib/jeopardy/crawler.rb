class Trebek
  class << self     
    def random
      response = JSON.parse(open(base_url + "random")).first
      Clue.new(response)
    end
    
    private
    def base_api
      "http://jservice.io/api/"
    end
  end
end
