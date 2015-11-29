module JAPI
  class Trebek
    class << self

      # Get a random clue from the service
      #
      # @param count [Fixnum] amount of clues to return, limited to 100 at a time
      #
      # @return [Array<Clue>] A list of random clues
      def random(count = 1)
        url = base_url << "random/?" << URI.encode_www_form({count: count})
        response = JSON.parse(open(url).read)

        response.map do |clue|
          Clue.new(clue)
        end
      end

      # Get a list of clues from the service
      #
      # @param options [Hash{String, Symbol => Fixnum, DateTime}] hash of query params for clue endpoint
      # @option options [Fixnum] :value the value of the clue in dollars
      # @option options [Fixnum] :category the id of the category you want to return
      # @option options [DateTime] :min_date earliest date to show, based on original air date
      # @option options [DateTime] :max_date latest date to show, based on original air date
      # @option options [Fixnum] :offset offsets the returned clues. Useful in pagination
      #
      # @return [Array<Clue>] A list of clues that fit the query params
      def clues(options = {})
        allowed_keys = ['value', 'category', 'max_date', 'min_date', 'offset']
        options.keys.each do |key|
          unless allowed_keys.include?(key.to_s)
            message = "#{key} is not allowed, please only use the following options: #{allowed_keys.join(', ')}"
            raise InvalidParamError.new(message)
          end
        end
        query = URI.encode_www_form(options)
        response = JSON.parse(open(base_url << 'clues/?' << query).read)

        response.map do |clue|
          Clue.new(clue)
        end
      end

      private
      def base_url
        "http://jservice.io/api/"
      end
    end
  end
end

