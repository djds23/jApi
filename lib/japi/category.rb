module JAPI
  # Category object with associated clues and a title.
  #
  # @author Dean Silfen
    class Category
    # @param options [Hash{String, Symbol => Fixnum, String}]
    # @option options [Fixnum] :clues_count amount of clues associated with this category
    # @option options [Fixnum] :id category id
    # @option options [Array<Hash>] :clues hashes for constructing clues. see {Clue}
    # @option options [String] :title the name of the category
    def initialize(options = {})
      @options = options
      if @options["clues"]
        @options["clues"] = @options["clues"].map { |clue| Clue.new(clue) }
      end
    end

    # @return [String] title of the category
    def title
      @options["title"]
    end

    # @return [Fixnum] id of the category
    def category_id
      @options["id"]
    end

    # @return [Fixnum] amount of clues associated with this category
    def clues_count
      @options["clues_count"]
    end

    # @return [Array<Clue>] array of clues associated with a Category
    def clues
      return @options["clues"] unless @options["clues"].nil?
      @options["clues"] = Trebek.category(category_id).clues
    end
  end
end


