require 'json'

module JAPI
  class Trebek
    class << self
      def random
        response = JSON.parse(open(base_url + "random").read).first
        Clue.new(response)
      end

      private
      def base_url
        "http://jservice.io/api/"
      end
    end
  end
end

