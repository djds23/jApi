module JAPI
  class Category

    def initialize(options = {})
      @options = options
      if @options["clues"]
        @options["clues"] = @options["clues"].map { |clue| Clue.new(clue) }
      end
    end

    def title
      @options["title"]
    end

    def category_id
      @options["id"]
    end

    def clues_count
      @options["clues_count"]
    end

    def clues
      return @options["clues"] unless @options["clues"].nil?
      @options["clues"] = Trebek.category(category_id).clues
    end
  end
end

