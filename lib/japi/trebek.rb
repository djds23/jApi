module JAPI
  # Interface for creating and requesting Clues & Categories
  #
  # @author Dean Silfen
    class Trebek
    class << self

      # Get a random clue from the service
      #
      # @param count [Fixnum] amount of clues to return, limited to 100 at a time
      #
      # @return [Array<Clue>] A list of random clues
      def random(count = 1)
        url = base_url + "random/?" + URI.encode_www_form({count: count})
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
      # @raise [InvalidParamError] if param not accepted by API is passed
      def clues(options = {})
        allowed_keys = ['value', 'category', 'max_date', 'min_date', 'offset']
        options.keys.each do |key|
          unless allowed_keys.include?(key.to_s)
            message = "#{key} is not allowed, please only use the following options: #{allowed_keys.join(', ')}"
            raise InvalidParamError.new(message)
          end
        end
        query = URI.encode_www_form(options)
        response = JSON.parse(open(base_url + 'clues/?' + query).read)

        response.map do |clue|
          Clue.new(clue)
        end
      end

      # Get a list of categories from the service
      #
      # @param options [Hash{String, Symbol => Fixnum}] hash of query params for clue endpoint
      # @option options [Fixnum] :count amount of categories to return, limited to 100 at a time
      # @option options [Fixnum] :offset offsets the starting id of categories returned. Useful in pagination.
      #
      # @return [Array<Category>] A list of clues that fit the query params
      # @raise [InvalidParamError] if param not accepted by API is passed
      def categories(options = {})
        allowed_keys = ['count', 'offset']
        options.keys.each do |key|
          unless allowed_keys.include?(key.to_s)
            message = "#{key} is not allowed, please only use the following options: #{allowed_keys.join(', ')}"
            raise InvalidParamError.new(message)
          end
        end
        query = URI.encode_www_form(options)
        response = JSON.parse(open(base_url + 'categories/?' + query).read)

        response.map do |category|
          Category.new(category)
        end
      end

      # Get clues of a single category from the service
      #
      # @param id [Fixnum] id of desired category
      #
      # @return [Category] A list of clues that fit the query params
      def category(id)
        query = URI.encode_www_form(id: id)
        response = JSON.parse(open(base_url + 'category/?' + query).read)
        Category.new(response)
      end

      private

      # @private
      # @return [String] base url for jservice.io endpoint, configurable with
      #   JAPI.configuration block method.
      def base_url
        JAPI.configuration.jservice_url
      end
    end
  end
end

